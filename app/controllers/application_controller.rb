class ApplicationController < ActionController::API
  # ヘルスチェック用のアクション
  def health
    render json: { status: 'ok' }
  end
end