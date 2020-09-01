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

- has_many :products
- has_many :orders


## Products テーブル

| Column                     | Type    | Options     |
| -------------------------- | ------- | ----------- |
| product_name               | string  | null: false |
| image                      | string  | null: false |
| user_id                    | integer | null: false |
| category_id                | integer | null: false |
| product_status_id          | integer | null: false |
| shipping_charges_id        | integer | null: false |
| prefecture_id              | integer | null: false |
| estimated_shipping_date_id | integer | null: false |
| favorite_flag              | boolean | null: false |
| price                      | integer | null: false |

### Association

- has_many :comments
- belong_to :orders


## Comments テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| comment    | text    | null: false |
| product_id | integer | null: false |
| user_id    | integer | null: false |

### Association

- belong_to :products


## SendingAddress テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | string  | null: false |
| user_id       | integer | null: false |

### Association

- belong_to :orders


## Orders テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| user_id            | integer | null: false |
| product_id         | integer | null: false |
| sending_address_id | integer | null: false |

### Association

- has_one :products
- has_one :sending_address


## Prefectures アクティブハッシュ

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| prefecture_name | string | null: false |


## Categorys アクティブハッシュ

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| Category | string | null: false |


## ProductStatus アクティブハッシュ

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| product_status | string | null: false |


## ShippingCharges アクティブハッシュ

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| shipping_charges | string | null: false |


## EstimatedShippingDate アクティブハッシュ

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| estimated_shipping_date | string | null: false |
