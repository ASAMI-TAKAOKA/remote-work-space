# TELESPO
<img width="1670" alt="トップビュー" src="https://user-images.githubusercontent.com/77926245/135076190-59e7463d-ab8a-4d58-aac8-63f81896f79f.png">
 
# 概要
テレワークにおすすめの場所をシェアしたり、探したりできるサービスです。

# URL
https://telespo.net/

# 使用技術・環境
- フロントエンド
  - HTML/SCSS
  - javaScript
- バックエンド
  - Ruby 3.0.0
  - Rails 6.1.4
- DB
  - MySQL 5.7
- 開発環境
  - VScode
  - Docker/docker-compose
- 本番環境
  - AWS（VPC, EC2, RDS, ACM, Route53, ALB, SES）
  - Nginx
  - puma
- バージョン管理
  - Git/GitHub
- テスト
  - Rspec
- その他技術
  - レスポンシブデザイン対応
  - Google Cloud Platform



# インフラ構成図
<div align="center">
<img width="1014" alt="AWS" src="https://user-images.githubusercontent.com/77926245/127286015-7328ab00-db0d-4543-8829-634581511084.png">
</div>

# ER図
<div align="center">
<img width="1014" alt="ER" src="https://user-images.githubusercontent.com/77926245/126564786-432d0b39-66f7-4632-b7e9-5afa67e4d26f.png">
</div>

# 機能一覧
- 認証機能
  - サインイン・サインアップ（devise）
  - ゲストログイン機能（アカウント削除、プロフィール編集不可）
  - パスワード再発行（mailer）
- ユーザー機能（ログイン済み投稿者のみ表示）
  - マイページ
    - 編集機能
        - ニックネーム、プロフィール写真、プロフィール文、Emailの編集が可能
    - フォロー、フォロワー一覧表示
  - ユーザー詳細ページ
    - フォロー、アンフォロー機能
    - フォロー、フォロワー一覧表示

- 投稿機能（ログイン済み投稿者のみ表示）
  - 新規投稿ページ
    - スポット名称、住所、私のイチオシポイントの記入
    - 画像投稿
    - 座標自動取得（geocoder）
  - 投稿一覧ページ
    - 検索機能
      - キーワード検索
        - 入力したキーワードを投稿内容からサーチ
    - スポット名称、住所、私のイチオシポイント、画像、投稿日時、更新日時の表示
    - 投稿者のページへのリンクボタン設置
    - 投稿詳細ボタンの設置
    - 投稿編集ボタンの設置
    - 投稿削除ボタンの設置
    - 位置情報表示機能（Geocoding API、Maps Javascript API）
    - すべての投稿内容を一つの地図上で一覧表示
      - 地図上でマーカーをクリックするとスポット名称が表示
      - 地図上でスポット名称をクリックすると投稿詳細ページへ遷移
  - 投稿詳細ページ
    - コメント機能
    - いいね機能
      - 登録・解除の即時反映

- その他
  - ページネーション機能（kaminari）
    - 投稿一覧ページ、ユーザー一覧ページに設定

# 工夫した箇所
- フロントエンド
  - なるべくシンプルなUI/UXデザイン
  - 使用する色を限定し、全体の統一感を意識

- バックエンド
  - **N+1問題を意識し”includesメソッド”でSQLの処理を軽量化**

- 技術
    - Docker
    - AWS

# 制作背景
私自身が前職でテレワークを行っていたこともあり、<br>
テレワークやプログラミングの勉強に便利な場所を
よくネットで探したりしていました。<br>
ちょっとした記事はありましたが、<br>
情報量が少なかったり、閉店したお店が掲載されていたりと、
不便さを感じていました。<br>
口コミサイトのようにシェアできる形なら、<br>
常に最新で、且つ多くの方々のリアルな情報を得ることができ、<br>
もっと便利になると考えこのアプリを開発いたしました。<br>
また、昨今はコロナ禍で人との交流を持ちづらいですが、<br>
このアプリが地元の人同士の交流につながりましたら、<br>
嬉しく思います。<br>

# デザイン一覧
#### 投稿一覧画面
<img width="1665" alt="投稿一覧" src="https://user-images.githubusercontent.com/77926245/135109741-be39ea9e-253b-45da-a2e9-20e05e7b02c6.png">
<img width="1665" alt="投稿一覧" src="https://user-images.githubusercontent.com/77926245/135109747-efb9d1c4-8a9b-44d0-a5d5-6376dbf4602c.png">

#### 地図画面（マーカーをクリックするとスポット名称が表示）
<img width="1665" alt="スポット名称が表示" src="https://user-images.githubusercontent.com/77926245/127287260-a8b6503e-cd9d-465b-8e5c-139ee398e93e.png">

#### 地図画面（スポット名称をクリックすると投稿詳細ページへ遷移）
<img width="1665" alt="投稿詳細ページへ遷移" src="https://user-images.githubusercontent.com/77926245/135110800-87385db4-4b6b-4cdf-bae4-8cd571d30d20.png">

#### ユーザー一覧画面
<img width="1665" alt="投稿詳細ページへ遷移" src="https://user-images.githubusercontent.com/77926245/135111479-940f74b0-1fa7-41aa-8f51-0f4eaad0f946.png">

# 今後の実装予定
React導入(SPA化)
→現在導入に向けReactの学習中

Capistrano導入
CircleCI導入
ECS導入
Rspecテストの充実

