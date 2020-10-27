class Genre < ApplicationRecord
  has_many :post_genre_relations
  has_many :posts, through: :post_genre_relations
end
