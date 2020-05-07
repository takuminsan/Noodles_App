User.create!(name:  "たくみ",
             email: ENV['TA93N_EMAIL_01'],
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "野村",
             email: ENV['TA93N_EMAIL_02'],
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
