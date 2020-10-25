FactoryBot.define do
  factory :post_category_relation do
    association :post, factory: :post
    association :category, factory: :category
  end
end
