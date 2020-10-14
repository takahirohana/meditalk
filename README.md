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

| Column          | Type   | Options     |
| -------------- -| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :medical_records

## rooms テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| room_name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## symptoms テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| part      | string     | null: false                    |
| cc        | string     | null: false                    |
| from_when | string     | null: false                    |
| where     | string     | null: false                    |
| situation | string     | null: false                    |
| PH        | string     | null: false                    |
| allergies | string     | null: false                    |
| medicine  | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| room      | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user