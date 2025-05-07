#!/bin/sh
# 既存のパッケージのアップデート
cd
sudo yum -y update
# 関連パッケージをインストール
sudo yum install -y ruby-devel rpm-build git gcc gcc-c++ zlib-devel openssl-devel rubygems-deve
# rbenvのインストール
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
# rbenv のパスを通す
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~/.rbenv/bin/rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source .bash_profile
# Ruby 2.6.3 のインストール
sudo yum install -y readline-devel
# 時間かかる
rbenv install -v 2.6.3
rbenv global 2.6.3
rbenv rehash
# nginx のインストールと起動
sudo amazon-linux-extras install -y nginx1
sudo systemctl enable nginx
sudo systemctl start nginx
# ImageMagickをインストール
sudo yum -y install libpng-devel libjpeg-devel libtiff-devel gcc
git clone https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.0.11
cd ImageMagick-7.0.11
./configure
make
sudo make install
gem install nokogiri -v 1.13.10
gem install rails-html-sanitizer -v 1.5.0
# Railsをインストール
gem install rails -v 5.2.5
# Node.js
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install -y nodejs
cd


