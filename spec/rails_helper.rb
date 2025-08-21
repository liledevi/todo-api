require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# 本番環境でテストを実行しないようにガード
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

# spec/support配下のファイルを読み込み
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# マイグレーションの状態をチェック
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # FactoryBotのメソッドを使えるように
  config.include FactoryBot::Syntax::Methods
  
  # Database Cleanerの設定（テスト後にDBをクリーン）
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  
  # 基本設定
  config.fixture_path = Rails.root.join('spec/fixtures')
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

# Shoulda Matchersの設定（テストを簡潔に書ける）
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end