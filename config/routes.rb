Rails.application.routes.draw do
  # ヘルスチェック用のエンドポイント
  get '/health', to: 'application#health'
end