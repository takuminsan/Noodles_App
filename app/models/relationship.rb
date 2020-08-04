class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" # followerというクラス名は存在しないので、正しいクラス名を伝える必要がある
  belongs_to :followed, class_name: "User" # followedというクラス名は存在しないので、正しいクラス名を伝える必要がある
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
