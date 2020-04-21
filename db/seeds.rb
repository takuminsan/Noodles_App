User.create!(name:  "ta93n_01",
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

User.create!(name:  "ta93n_03",
            email: "nideratakumin@yahoo.co.jp",
            password:              "password",
            password_confirmation: "password",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)


3.times do |n|
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
