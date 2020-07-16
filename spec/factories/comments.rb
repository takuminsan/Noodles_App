FactoryBot.define do
  factory :comment do
    association :post, factory: :post
    user { post.user }
    content { "いいね！" }
  end
end
