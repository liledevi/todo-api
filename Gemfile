source 'https://rubygems.org'

# Rubyバージョンの指定（3.4.0以上3.5.0未満を許可）
ruby '~> 3.4.0'

# ===== 基本のGem =====
gem 'mysql2', '~> 0.5'               # MySQLデータベース接続用
gem 'puma', '>= 5.0'                 # Webサーバー（高速・安定）
gem 'rails', '~> 8.0.2'              # Railsフレームワーク本体

# ===== 認証・セキュリティ関連 =====
gem 'bcrypt', '~> 3.1.7'             # パスワードの暗号化（必須！）
gem 'rack-cors'                      # 別ドメインからのアクセス許可

# ===== API開発用 =====
gem 'active_model_serializers', '~> 0.10.0' # JSONレスポンスを綺麗に整形

# ===== 共通ユーティリティ =====
gem 'bootsnap', require: false # 起動高速化
gem 'tzinfo-data', platforms: %i[windows jruby] # タイムゾーン情報

# ===== 開発・テスト環境用 =====
group :development, :test do
  gem 'debug', platforms: %i[mri windows] # デバッグツール
  gem 'dotenv-rails'                         # 環境変数を.envファイルで管理
  gem 'factory_bot_rails'                    # テストデータ作成を簡単に
  gem 'faker'                                # ダミーデータ生成（テスト用）
  gem 'rspec-rails', '~> 6.0' # テストフレームワーク（RSpec）
end

# ===== 開発環境専用 =====
group :development do
  gem 'better_errors'         # エラー画面を見やすく
  gem 'binding_of_caller'     # エラー画面で変数の中身を確認
  gem 'rubocop', require: false          # Rubyコードの書き方チェック
  gem 'rubocop-rails', require: false    # Rails専用ルール
  gem 'rubocop-rspec', require: false    # RSpec専用ルール
end

# ===== テスト環境専用 =====
group :test do
  gem 'database_cleaner-active_record'       # テスト後のDB掃除
  gem 'shoulda-matchers', '~> 5.0'           # テストを簡潔に書ける
  gem 'simplecov', require: false            # テストカバレッジ測定
end
