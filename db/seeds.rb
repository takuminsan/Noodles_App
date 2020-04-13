User.create!(name:  "ta93n",
             email: "nideratakumin@gmail.com",
             password:              "1234takumin",
             password_confirmation: "1234takumin",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "ta93n_02",
             email: "ta93n@icloud.com",
             password:              "1234takumin",
             password_confirmation: "1234takumin",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
