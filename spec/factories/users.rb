FactoryBot.define do
  factory :michael, class: User do
    name { 'Michael Example' }
    email { 'michael@test.com' }
    password_digest { User.digest('password') }
    admin { true }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :archer, class: User do
    name { 'Sterling Archer' }
    email { 'duchess@test.gov' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :lana, class: User do
    name { 'Lana Kane' }
    email { 'hands@test.gov' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :malory, class: User do
    name { 'Malory Archer' }
    email { 'boss@test.gov' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :test_user, class: User do
    name { 'test_user' }
    email { 'test@test.com' }
    password_digest { User.digest('password') }
    activated { true }
    activated_at { Time.zone.now }
  end
end
