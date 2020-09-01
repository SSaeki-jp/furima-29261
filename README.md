# README

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

# テーブル設計

## Users テーブル

| Column                       | Type   | Options     |
| ---------------------------- | ------ | ----------- |
| nickname                     | string | null: false |
| email                        | string | null: false |
| password                     | string | null: false |
| lastname_fullwidth_kanji     | string | null: false |
| firstname_fullwidth_kanji    | string | null: false |
| lastname_fullwidth_katakana  | string | null: false |
| firstname_fullwidth_katakana | string | null: false |
| birthday                     | date   | null: false |

### Association

- has_many  :products
- has_many  :orders


## Products テーブル

| Column                     | Type    | Options           |
| -------------------------- | ------- | ----------------- |
| name                       | string  | null: false       |
| image                      | string  | null: false       |
| user_id                    | integer | foreign_key: true |
| category_id                | integer | null: false       |
| product_status_id          | integer | null: false       |
| shipping_charges_id        | integer | null: false       |
| prefecture_id              | integer | null: false       |
| estimated_shipping_date_id | integer | null: false       |
| favorite_flag              | boolean | null: false       |
| price                      | integer | null: false       |

### Association

- has_many   :comments
- has_one    :order
- belongs_to :user


## Comments テーブル

| Column     | Type    | Options           |
| ---------- | ------- | ----------------- |
| comment    | text    | null: false       |
| product_id | integer | foreign_key: true |
| user_id    | integer | foreign_key: true |

### Association

- belongs_to :product


## SendingAddress テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |
| user_id       | integer | null: false |

### Association

- belongs_to :order


## Orders テーブル

| Column             | Type    | Options           |
| ------------------ | ------- | ----------------- |
| user_id            | integer | foreign_key: true |
| product_id         | integer | foreign_key: true |

### Association

- has_one    :product
- has_one    :sending_address
- belongs_to :user
