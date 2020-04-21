class Post < ApplicationRecord
  belongs_to :user
  scope :recent, -> { order(updated_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :shop_name, presence: true, length: { maximum: 20 }
  validates :nearest, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 1000 }
  validate  :picture_size

  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "画像は5MBより小さくしてください。")
      end
    end
end
