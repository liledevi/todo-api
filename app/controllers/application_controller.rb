class ApplicationController < ActionController::API
  # ヘルスチェック用のアクション
  def health
    render json: { status: 'ok' }
    timestamp: Time.current
  end
end