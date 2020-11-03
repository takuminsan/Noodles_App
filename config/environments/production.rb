Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.require_master_key = true
  config.public_file_server.enabled = true
  # 上記はpublicフォルダからの静的ファイルの提供を有効にする
  # config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present? ←デフォルト設定
  config.assets.js_compressor = Uglifier.new(harmony: true)
  config.assets.compile = true
  config.active_storage.service = :amazon
  # config.force_ssl = true ←でSSL通信をするかどうか設定できる
  config.log_level = :debug
  config.log_tags = [:request_id]

  # メイラーの設定
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = 'noodles-app.com'
  config.action_mailer.default_url_options = { host: host, protocol: 'https' }
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    domain: "gmail.com",
    port: 587,
    user_name: Rails.application.credentials.gmail[:USER_NAME],
    password: Rails.application.credentials.gmail[:PASSWORD],
    authentication: :login
  }
  config.i18n.fallbacks = [I18n.default_locale]
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
  # production.log一定期間でファイルを自動削除するようにする
  config.logger = Logger.new("log/production.log", 5, 10 * 1024 * 1024)
end
