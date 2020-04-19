class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(updated_at: :desc) }
  validates :user_id, presence: true
  validates :shop_name, presence: true, length: { maximum: 20 }
  validates :nearest, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 1000 }
end
