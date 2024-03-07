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
