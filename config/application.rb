require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    config.load_defaults 5.2

    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    # railsの時刻データを日本時刻にする
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true # ブラウザ側でJavaScriptが無効になっていた場合 (Ajaxリクエストが送れない場合)でもうまく動くようにする

    config.generators do |g|
      g.factory_bot false                           # Railsジェネレータがfactory_bot用のファイルを生成するのを無効化
      g.factory_bot dir: 'custom/dir/for/factories' # ファクトリファイルの置き場を変更
    end
  end
end
