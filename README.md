# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday_id        | datetime | null: false               |

### Association

- has_many :items, dependent: :destroy
- has_many :histories


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| explanation    | text       | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| charge_id      | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| leadtime_id    | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_one :histories

## histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| build_name       | string     |                                |
| telephone_number | string     | null: false                    |
| history          | references | null: false, foreign_key: true |


### Association

- has_one :histories
