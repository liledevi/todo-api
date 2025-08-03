# ベースイメージの指定
FROM ruby:3.4

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  default-mysql-client \
  npm \
  vim

# Node.jsの最新版をインストール（Rails 8のため）
RUN npm install -g yarn

# 作業ディレクトリの設定
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile* ./

# Gemのインストール
RUN bundle install

# アプリケーションのコードをコピー
COPY . .

# ポート3000を公開
EXPOSE 3000

# サーバー起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]