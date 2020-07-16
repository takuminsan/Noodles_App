FactoryBot.define do
  factory :user do # :userという名前のUserクラスのファクトリを定義（クラスは:userという名前から自動類推）
    name { 'テストユーザー' }
    email { 'test1@example.com' }
    password_digest { User.digest('password') }
    admin { true }
    activated { true }
    activated_at { Time.zone.now }
  end
end
