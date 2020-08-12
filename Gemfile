source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bcrypt', '3.1.12' # has_secure_passwordを使ってパスワードをハッシュ化するために必要
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '3.3.7' # BootstrapではLESS言語を使っているが、RailsのAsset PipelineはデフォルトではSass言語をサポート
gem 'bootstrap-will_paginate', '1.0.0' # will_paginateを構成するためのBootstrapのページネーションスタイル
gem 'carrierwave' # 画像アップローダー
gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails'
gem 'http'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'rails'
gem 'rails-i18n'
gem 'rmagick' # 画像処理
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate' # ページネーションメソッドを使えるようにする

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano' # capistranoと、下記それに付随するもの
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'aws-sdk-s3'
  gem 'fog-aws' # 本番環境で画像をアップロードする
end

group :production, :staging do
  gem 'unicorn'
end

group :test do
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
