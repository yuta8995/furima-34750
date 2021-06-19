# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type       | Options              |
| ------------------- | ---------- | -------------------- |
| item_name           | string     | null: false          |
| item_description    | text       | null: false          |
| category_id         | integer    | null: false          |
| item_condition_id   | integer    | null: false          |
| shipping_paid_by_id | integer    | null: false          |
| item_location_id    | integer    | null: false          |
| shipping_date_id    | integer    | null: false          |
| price               | integer    | null: false          |
| user                | references | foreign_key: true    |

### Association

- belongs_to :user
- has_one    :buyer

## buyers テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| item_location_id | integer    | null: false       |
| municipality     | string     | null: false       |
| building_name    | string     |                   |
| tel              | string     | null: false       |
| buyer            | references | foreign_key: true |

### Association

- belongs_to :buyer