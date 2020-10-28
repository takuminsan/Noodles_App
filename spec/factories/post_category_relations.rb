FactoryBot.define do
  factory :post_genre_relation do
    association :post, factory: :post
    association :genre, factory: :genre
  end
end
