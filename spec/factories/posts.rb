FactoryBot.define do
  factory :post_01, class: Post do
    id { 1 }
    shop_name { "Noodles-01" }
    nearest { "sinjuku-station" }
    content { "美味しい！" }
    created_at { 10.hours.ago }
    user { build(:michael) }
  end
end
