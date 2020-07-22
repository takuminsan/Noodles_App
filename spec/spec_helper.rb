require 'capybara/rspec' # RSpecでCapybaraを扱うために必要な機能を読み込む

RSpec.configure do |config|
  config.before(:each) do |example| # システムテストを実行するドライバ（ブラウザ相当の機能を利用するために必要なプログラム）の設定
    if example.metadata[:type] == :system
      driven_by :selenium, using: :headless_chrome, screen_size: [1280, 800], options: { args: %w[headless disable-gpu no-sandbox disable-dev-shm-usage] }
    end
  end

  config.include Capybara::DSL # Capybara::DSL読み込み

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
