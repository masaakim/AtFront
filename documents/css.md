# CSS
Sassを使う

記法: scss
ディレクトリ: `src/stylesheets`

bootstrap使ってる

## 構成
- `app.scss` (全パーシャルファイルをまとめたもの（必要なら）)
- `common.scss` (全ページで使う共通のcss)
- `/common` (common.scssで読み込むパーシャルファイル)
- `ui.scss` (UIパーツ（bootstrap使うならあまりいらないかも）)
- `/ui` (ui.scssで読み込むパーシャルファイル)
- `_config.scss` (heightとかcolorとかの設定ファイル)
- `/config` (config.scssで読み込むパーシャルファイル)

スマホ向けのはsp-* 付ける

基本的にcommon.cssと各ページ固有のcssは別に読み込む
