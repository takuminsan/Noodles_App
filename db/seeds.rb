User.create!(name:  "ta93n",
             email: "nideratakumin@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "ta93n_02",
             email: "ta93n@icloud.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
name  = "sample_user-#{n+1}"
email = "example-#{n+1}@sample.com"
password = "password"
User.create!(name: name,
            email: email,
            password:              password,
            password_confirmation: password,
            admin: false,
            activated: true,
            activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
2.times do
  users.each { |user| user.posts.create!(shop_name: "某ラーメン屋",
                                           nearest: "新宿駅",
                                           content: "美味しい！") }
end
