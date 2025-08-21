Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/health', to: 'application#health'
    end
  end
end