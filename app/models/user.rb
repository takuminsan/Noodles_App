class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", # Relationshipモデルを見つけるために、クラス名を明示的に伝える必要がある
                                  foreign_key: "follower_id", # userとactive_relationshipsを繋ぐ外部キーを明示的に伝える
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  # Userモデルにfollowingの関連付けを追加する (:sourceパラメーターを使って、「following配列の元はfollowed idの集合である」ということを明示的にRailsに伝える)
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  attr_accessor :remember_token, :activation_token, :reset_token

  before_save   :downcase_email # { self.email = email.downcase }
  before_create :create_activation_digest

  validates :name,  presence: true, length: { maximum: 16 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i       # メールアドレスを検証するための正規表現
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },                       # メールアドレスのフォーマットを検証する
                    uniqueness: { case_sensitive: false }                      # uniqueness: true かつ emailの大文字・小文字を区別しない設定 (アドレスが大文字・小文字で異なっていても一意とみなす必要があるため)
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true # allow_nil: trueすることで、パスワードが空のままでも更新できるようになる (新規登録ではhas_secure_passwordが存在性を検証する)
  validate  :picture_size

  # セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できるようにする
  # 2つのペアの仮想的な属性 (passwordとpassword_confirmation) を使えるようにする。また、存在性と値が一致するかどうかのバリデーションも追加される
  # authenticateメソッドを使えるようにする (引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド)
  has_secure_password

  # 渡された文字列のハッシュ値を返す (secure_passwordのソースコードを参考としている)
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost) # stringはハッシュ化する文字列、costはコストパラメータ (ハッシュを算出するための計算コスト)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64 # Ruby標準ライブラリのSecureRandomモジュールにあるurlsafe_base64メソッドで長くてランダムな文字列を生成
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token                                    # ユーザーのremember_token仮想属性にランダムなトークンを代入
    update_attribute(:remember_digest, User.digest(remember_token))         # 特定の属性 (remember_digest)のみ更新したいので、update_attributesではなく、update_attribute
  end

  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest") # 引数を正しく組み立て、sendメソッドを使ってex.activation_digest等の属性にアクセス
    return false if digest.nil? # ex.記憶ダイジェストがnilの場合はfalseを返して処理を終了させる (ユーザーの記憶ダイジェストは存在しないがcookiesの記憶トークンは存在する、という状況の回避)

    BCrypt::Password.new(digest).is_password?(token) # secure_passwordのソースコードを参考。渡されたトークンがユーザーの記憶ダイジェストと一致することを確認
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # アカウントを有効にする
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now # UserMailerのaccount_activation(user)メソッド。deliver_nowは、今すぐに送信したい場合に使用
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token                           # ユーザーのreset_token仮想属性にランダムなトークンを代入
    update_attribute(:reset_digest,  User.digest(reset_token))  # 特定の属性 (reset_digest)のみ更新したいので、update_attributesではなく、update_attribute
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now # UserMailerのpassword_reset(user)メソッド。deliver_nowは、今すぐに送信したい場合に使用
  end

  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago # 「現在時刻より2時間前の時間」が「パスワード再設定メールを送信した時間」より大きい場合は2時間経過していることになり、trueを返す
  end

  # ユーザーのステータスフィードを返す
  # 「userがフォローしているユーザーすべてを選択する」というSQL(サブセレクト)を既存のSQLに内包させる形
  # サブセレクトは集合のロジックを (Railsではなく) データベース内に保存するので、より効率的にデータを取得することができる
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  # ユーザーをフォローする
  def follow(other_user)
    self.following << other_user # selfは省略可能
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy # selfは省略可能
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    self.following.include?(other_user) # selfは省略可能
  end

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = User.new_token # 仮想属性activation_tokenにランダムなトークンを代入
      self.activation_digest = User.digest(activation_token) # activation_tokenをダイジェスト化し、ユーザーのactivation_digestカラムに保存
    end

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if image.size > 5.megabytes
        errors.add(:image, "画像は5MBより小さくしてください。")
      end
    end
end
