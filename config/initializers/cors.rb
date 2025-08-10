# CORSの設定ファイル
# このファイルを変更したらサーバーの再起動が必要です

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # 開発環境では指定したURLからのアクセスを許可
    # 本番環境では、実際のフロントエンドのURLに変更する
    origins ENV.fetch("FRONTEND_URL", "http://localhost:3001")

    # 許可する内容の詳細設定
    resource "*",                                    # 全てのAPIパスで有効
      headers: :any,                                # 全てのヘッダーを許可
      methods: [:get, :post, :put, :patch, :delete, :options, :head],  # 許可するHTTPメソッド
      expose: ["Authorization"],                    # フロントエンドに公開するヘッダー
      max_age: 600                                 # プリフライトリクエストのキャッシュ時間（秒）
  end
end