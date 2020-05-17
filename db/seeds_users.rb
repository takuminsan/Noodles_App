User.create!(name:  "＠テストユーザー",
             email: 'test@test-user.com',
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "たくみ",
             email: Rails.application.credentials.EMAIL[:TA93N_EMAIL_01],
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_takumi.jpg'))

User.create!(name:  "野村さん",
             email: Rails.application.credentials.EMAIL[:TA93N_EMAIL_02],
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_nomura_san.jpg'))

User.create!(name:  "ねこさん",
             email: "seed02@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_neko_san.jpg'))

User.create!(name:  "伊藤",
             email: "seed03@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_itou.jpg'))

User.create!(name:  "cat",
             email: "seed04@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_cat.jpg'))

User.create!(name:  "お酒好きマン",
             email: "seed05@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_osake_suki.jpg'))

User.create!(name:  "一般男性＠ビール飲みたい",
             email: "seed06@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_bi-ru_nomitai.jpg'))

User.create!(name:  "革野小物",
             email: "seed07@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_kawa_komono.jpg'))

User.create!(name:  "めい（猫）",
             email: "seed08@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_mei.jpg'))

User.create!(name:  "10sei0otto",
             email: "seed09@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_10sei0otto.jpg'))

User.create!(name:  "鈴木氏",
             email: "seed10@test.com",
             password:              "password",
             password_confirmation: "password",
             admin: false,
             activated: true,
             activated_at: Time.zone.now,
             image: File.open('./public/seeds_image/image_suzukishi.jpg'))
