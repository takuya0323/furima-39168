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

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false, uniqueness: true |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthday           | date   | null: false                   |
 
### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| user_id           | references  | null: false, foreign_key: true |
| name              | string      | null: false                    |
| information       | text        | null: false                    |
| category_id       | integer     | null: false                    |
| item_status_id    | integer     | null: false                    |
| shipping_cost_id  | integer     | null: false                    |
| shipping_date_id  | integer     | null: false                    |
| prefecture_id     | integer     | null: false                    |
| price             | integer     | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type         | Options                        |
| ---------- | ------------ | ------------------------------ |
| user_id    | references   | null: false, foreign_key: true |
| item_id    | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destination テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| order_id       | references  | null: false, foreign_key: true |
| postcode       | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| city           | string      | null: false                    |
| block          | string      | null: false                    |
| building       | string      |                                |
| phone_number   | string      | null: false                    |


### Association

- belongs_to :order

