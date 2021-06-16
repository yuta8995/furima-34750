# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_image       | text       | null: false |
| item_name        | text       | null: false |
| item_description | text       | null: false |
| category         | string     | null: false |
| item_condition   | string     | null: false |
| shipping_paid_by | string     | null: false |
| item_location    | string     | null: false |
| shipping_date    | integer    | null: false |
| seller           | string     | null: false |
| user             | references |             |

### Association

- belongs_to :user
- has_one    :buyer

## buyers テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| buyer_name | string     | null: false |
| user       | references |             |

### Association

- belongs_to :user
- has_one    :item
- has_one    :ship

## ships テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| municipality | string  | null: false |
| address      | text    | null: false |
| tel          | integer | null: false |

### Association

- has_one    :buyer