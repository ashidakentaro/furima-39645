# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |

### Association

- has_many :items, dependent: :destroy
- has_many :comments
- has_one :send

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| explanation | text       | null: false                
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- has_one_attached :image
- has_many :comments, dependent: :destroy

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## sends テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| post_code        | integer | null: false |
| city             | string  | null: false |
| address          | string  | null: false |
| build_name       | string  |             |
| telephone_number | integer | null: false |

### Association

- belongs_to :user