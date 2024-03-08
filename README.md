# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last name          | string | null: false |
| first name(kana)   | string | null: false |
| last name          | string | null: false |
| first name(kana)   | string | null: false |
| date of birth      | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               | image      | null: false |
| item_name           | string     | null: false |
| description         | text       | null: false |
| category            | string     | null: false |
| condition           | string     | null: false |
| shipping_fee_bearer | string     | null: false |
| origin_area         | string     | null: false |
| shipping_days       | string     | null: false |
| price               | string     | null: false |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| card_info     | string     | null: false |
| exp_date      | string     | null: false |
| security_code | string     | null: false |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| phone_number  | string     | null: false |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item