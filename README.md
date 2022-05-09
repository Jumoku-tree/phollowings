# README
## DB設計
### usersテーブル
| column             | type   | options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| profile            | text   |                           |
| encrypted_password | string | null: false               |

#### Association
- has_many: posts
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
- has_many: tools, through :work_tools

### commentsテーブル
| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| comment_txt | text       | null: false                    |
| phollowing  | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

#### Association
- belongs_to: post# README
## DB設計
### usersテーブル
| column             | type   | options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| profile            | text   |                           |
| encrypted_password | string | null: false               |

#### Association
- has_many: posts
- has_many: comments

### postsテーブル
| column        | type       | options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| caption       | text       | null: false                    |
| category_id   | integer    | null: false                    |
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
| phollowing  | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

#### Association
- belongs_to: post
- belongs_to: user

- belongs_to: user


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
