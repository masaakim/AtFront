# ディレクトリ構成とインストール

## ディレクトリ構成

### build
コンパイルされたり、concatされたファイル置き場
htmlから読み込むのはここのファイル

- js
 - vendor(.min).js (bowerでインストールしたライブラリのconcat)
- css


### src

- javascripts
- stylesheets
- vendor
 - bowerのインストール先

### img
## 使用するツール
- Sass + Compass
- Grunt
- Bower


## インストール
nodeとrubyの実行環境が必要

Macだとrubyはデフォルトで入ってるけどv1.8.7でSass 3.2が入るのかわからない

nodeのインストールは[公式サイト](http://nodejs.org/download/)から

- bundle install
- (npm install -g grunt)
- npm install
- (npm install -g bower)
- bower install hogehoge --save
