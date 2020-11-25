source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bcrypt' # has_secure_passwordを使ってパスワードをハッシュ化するために必要
gem 'bootsnap', require: false # 起動時間を短縮させるgem
gem 'bootstrap-sass' # BootstrapではLESS言語を使っているが、RailsのAsset PipelineはデフォルトではSass言語をサポート
gem 'bootstrap-will_paginate' # will_paginateを構成するためのBootstrapのページネーションスタイル
gem 'carrierwave' # 画像アップローダー
gem 'coffee-rails'
gem 'dotenv-rails' # .envファイルに書いた設定を環境変数として簡単に読み込めるgem
gem 'http' # rubyでhttp通信を可能にする
gem 'jbuilder' # JSON形式のデータを作成
gem 'jquery-rails' # jQueryを使えるようにする
gem 'mysql2' # DBにMySQLを選択する
gem 'puma' # APサーバ
gem 'rails', '6.0.3.1'
gem 'rails-i18n' # Railsの日本語化対応
gem 'rmagick' # 画像処理
gem 'sassc-rails' # Sass(効率的にCSSを書くことのできる言語)を使えるようにする
gem 'uglifier' # JS軽量化
gem 'will_paginate' # ページネーションメソッドを使えるようにする

group :development, :test do
  gem 'bcrypt_pbkdf' # capistranoで本番環境サーバーにSSH接続する際に必要
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # デバッグ
  gem 'capistrano' # capistranoと、下記それに付随するもの
  gem 'capistrano-bundler' # デプロイ時にbundleを実行
  gem 'capistrano-rails' # デプロイ時にmigrationとassets:precompileを実行
  gem 'capistrano-rbenv' # rbenvのパスを設定する
  gem 'capybara' # ブラウザ操作をシミュレートする
  gem 'ed25519' # capistranoで本番環境サーバーにSSH接続する際に必要
  gem 'factory_bot_rails' # Rspecで用いるテストデータの作成
  gem 'rspec_junit_formatter' # RSpecテスト結果をCircle CIで取り扱えるようにする
  gem 'rspec-rails' # テストフレームワーク
  gem 'selenium-webdriver' # Webブラウザをプログラムから自動的に操作する
end

group :development do
  gem 'listen' # ファイルの変更を検知してそれをフックに何か処理ができる
  gem 'rubocop', require: false # Rubyの静的コード解析ツール
  gem 'spring' # Railsアプリケーションのプリローダー
  gem 'spring-watcher-listen' # springのファイルシステムの変更検知方法をpollingからlistenに変更
  gem 'web-console' # View内でコンソールを立ち上げて、変数やparameterなどの状態を見ることができる
end

group :production do
  gem 'aws-sdk-s3' # Amazon S3用の公式AWS Ruby gem
  gem 'fog-aws' # 本番環境で画像をアップロードする
end

group :production, :staging do
  gem 'unicorn' # APサーバ
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # TZInfoが参照するタイムゾーン情報を提供する
