# README
## アプリ名
Phollowings

## アプリケーション概要
創作イラストや写真のBEFOREとAFTERに注目し、変化を楽しむツールです。
例えばお気に入りのブラシを見つけたとき、新たな加工方法を見つけたときなど。
自分だけのメモにも仲間との共有にも利用できます。

## 更新履歴
### 2022/5/27
- 更新履歴を追加しました。
- 検索機能をキャプションだけでなくタイトルからも検索できるようにしました。

## 利用方法
### 作品投稿
1.トップページの左側サイドバーから新規ユーザー登録をします。
2.作品投稿のリンクを押し、「タイトル」「画像（2枚まで、1枚は必須）」「キャプション」「カテゴリ」「使用ツール」を入力し投稿します。
3.トップページから、他ユーザーの公開作品を閲覧できます。

### この変化イイ！と思ったら
1.お気に入りに登録すれば、いつでも一覧から見ることができます。

※このアプリは開発途中のため、まだ実装されていない機能がありますが、順次追加していく予定です。

## アプリケーションを作成した背景
普段趣味でイラストを描いたり、同じ趣味の人とSNSなどで交流していくなかで、創作作品の変化は創作者にとって大きなモチベーションになっていると感じていました。一方で、「以前のような絵が描けない」「試してみたいことがあるがよくわからない」といった悩みの種になっていることもありました。  
そのため、イラスト創作における「変化」からもっと楽しみを見いだせるような環境があればいいなと考えました。
「1年前の絵をリメイクしてみた」「新たなツールを導入したので試してみた」のような、創作におけるビフォーアフターをテーマに開発を進めました。  
自分の中でこっそりと変化を楽しんでもOK、他の人の作品の変化を観察したりしてもOK、イラスト創作者のモチベーションに繋がれば嬉しいです。

## 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1WYBOwE-cdmaZk8ro14c82jMZPg1-i1KrzMzy6FpQHRo/edit?usp=sharing)  
Googleスプレッドシートを開きます。

## 実装した機能についての画像やGIF、その他説明
### トップページ
![トップページ画像](/public/introduce/index.jpg)

## 実装予定の機能
- リファレンス（引用）機能
  →リファレンスを許可している投稿に関連した投稿ができる機能（例：他の人の線画を塗ってみた）
- SNSアカウントを用いてのログイン
- ユーザーのフォロー
- 投稿非公開機能

## データベース設計
![ER図](/public/introduce/ER.png)

## 画面遷移図
![画面遷移図](/public/introduce/transition.png)

## 開発環境
HTML, CSS, JavaScript, JQuery, Bootstrap, Ruby, VSCode, GitHub

## ローカルでの動作方法
% git clone https://github.com/Jumoku-tree/phollowings
% cd phollowings
% bundle install
% yarn install

## 工夫したポイント
- イラスト投稿がメインのアプリなので、ビューファイルはシンプルにして、投稿されたイラストが目立つようにしました。
- タグやカテゴリ分けを用いて、見たい作品を探しやすいようにしました。


## DB設計
### usersテーブル
| column             | type   | options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| profile            | text   |                           |
| encrypted_password | string | null: false               |

#### Association
- has_many: works
- has_many: comments

### worksテーブル
| column        | type       | options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| caption       | text       | null: false                    |
| category_id   | integer    | null: false                    |
| tool_id       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

#### Association
- has_many: comments
- belongs_to :user
- belongs_to :category
- has_many_attached: images

### commentsテーブル
| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| comment_txt | text       | null: false                    |
| work        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

#### Association
- belongs_to: work
