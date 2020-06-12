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
  - Docker/docker-compose
  - minitest,RSpec
  - Git, GitHub
  - Google Maps Platform
## 機能一覧
- ユーザー機能
  - 新規登録（メール送信によるユーザー認証）、ログイン、ログアウト機能
  - ユーザー一覧、マイページ、登録情報編集機能<br><br>
- 投稿機能
  - 投稿一覧表示、投稿詳細表示、投稿、投稿編集、投稿削除機能
  - 画像のアップロードはCarrierWaveを使用
  - 投稿内地図の表示はGoogleMapsAPIを使用<br><br>
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
- 「地図から投稿検索」機能
  - 「自分の投稿」、「フォロー中のユーザーと自分の投稿」を指定可能<br><br>
- minitestによる自動テスト機能
  - 単体テスト機能
  - 統合テスト機能
## 制作背景
よく食べるラーメン。何気なく写真を撮ってはTwitterに投稿するだけでしたが、<br>
食べたラーメンを記録し、一覧で見返したり、友だちと共有できれば<br>よりラーメンを楽しむことができるなと思い、制作しました。
## 今後の予定
- テストをminitest→RSpecで書き直し（途中）
- CircleCIに入門
- 各ページタイトルの設定
- 投稿一覧の各postにコメント数とアイコンを表示
- 新たな機能の検討・実装
