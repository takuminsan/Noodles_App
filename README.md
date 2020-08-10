## Noodlesとは
https://noodles-app.com<br>
ラーメン屋さんの写真や情報を友だちと共有できるアプリケーションです。
## 使用技術
- フロントエンド
  - HTML, SCSS, JavaScript, jQuery, Bootstrap
  - レスポンシブデザイン<br><br>
- バックエンド
  - Ruby 2.6.5
  - Rails 5.2.4.3<br><br>
- DB
  - MySQL 5.7.30<br><br>
- サーバー
  - Nginx
  - Unicorn<br><br>
- インフラ・開発環境等
  - AWS（VPC, EC2, RDS, S3, Route 53, ALB, ACM）
  - Docker/docker-compose(ローカル開発環境)
  - CircleCI(自動ビルド、自動テスト)
  - RSpec
  - rubocop
  - Git, GitHub
  - Google Maps Platform
## 機能一覧
- ユーザー機能
  - 新規登録（メール送信によるユーザー認証）、ログイン、ログアウト機能
  - ユーザー一覧、マイページ、登録情報編集機能<br><br>
- 投稿機能
  - 投稿一覧表示、投稿詳細表示、投稿、投稿編集、投稿削除機能
  - 画像のアップロードはCarrierWaveを使用
  - 投稿内地図の表示はGoogleMapsAPIを使用
  - 投稿詳細ページをTwitterで共有可能<br><br>
- コメント機能
  - コメント表示、コメント投稿、コメント削除機能<br><br>
- ページネーション機能
  - will_paginate + bootstrap-will_paginateを使用<br><br>
- いいね機能（アプリケーション内では「食べたい！」と表記）
  - 登録したいいねの一覧表示機能
  - Ajaxを使用<br><br>
- フォロー機能
  - フォロー、フォロワー一覧表示機能
  - Ajaxを使用<br><br>
- 投稿検索機能
  - ヘッダーに検索フォーム設置
  - ヘッダーに「地図から投稿検索」設置<br><br>
- レスポンシブ
  - スマートフォンでの閲覧時にハンバーガーメニューとなるサイドバーを実装<br><br>
- RSpecによる自動テスト機能
  - 単体テスト機能
  - 統合テスト機能
## ER図
  ![200805_ER図_Noodles (1)](https://user-images.githubusercontent.com/57702892/89441555-4d434600-d788-11ea-9256-1efeb996b68c.jpg)
## 制作背景
みんな大好きなラーメン。何気なく写真を撮ってはTwitterに投稿するだけでしたが、<br>
食べたラーメンを記録し、一覧で見返したり、友だちと共有できれば<br>よりラーメンを楽しむことができるのではと考え、開発しました。
## 今後の予定
- 理解が浅い部分が多くあるため、理解を深める
- Capistranoを使用した自動デプロイ
- 新たな機能の検討・実装
- フロント強化
