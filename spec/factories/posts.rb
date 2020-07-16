FactoryBot.define do
  factory :post do
    shop_name { "Noodles-01" }
    nearest { "sinjuku-station" }
    content { "美味しい！" }
    created_at { 10.hours.ago }
    association :user, factory: :user # userというファクトリを、Postモデルに定義されたuserという名前の関連を生成する
  end
end
