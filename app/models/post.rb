class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  scope :recent, -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :shop_name, presence: true, length: { maximum: 20 }
  validates :nearest, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 1000 }
  validate  :picture_size

  # ポストをlikeする
  def like(user)
    likes.create(user_id: user.id)
  end

  # ポストのlikeを解除する
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがlikeしてたらtrueを返す
  def like?(user)
    like_users.include?(user)
  end

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "画像は5MBより小さくしてください。")
      end
    end
end
