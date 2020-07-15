FactoryBot.define do
  factory :michael, class: User do # :michaelという名前のUserクラスのデータを定義
    id { 1 }
    name { 'Michael Example' }
    email { 'michael@test.com' }
    password_digest { User.digest('password') }
    admin { true }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :archer, class: User do
    id { 2 }
    name { 'Sterling Archer' }
    email { 'duchess@test.gov' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :lana, class: User do
    id { 3 }
    name { 'Lana Kane' }
    email { 'hands@test.gov' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :malory, class: User do
    id { 4 }
    name { 'Malory Archer' }
    email { 'boss@test.gov' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :test_user, class: User do
    id { 5 }
    name { 'test_user' }
    email { 'test@test.com' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end
end
