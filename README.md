# テーブル設計

## users テーブル

<<<<<<< Updated upstream
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | date     | null: false               |
=======
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday_year_id   | integer | null: false               |
| birthday_month_id  | integer | null: false               |
| birthday_day_id    | integer | null: false               |
>>>>>>> Stashed changes

### Association

- has_many :items, dependent: :destroy
<<<<<<< Updated upstream
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
| prefecture_id  | integer    | null: false                    |
| leadtime_id    | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image
- has_one :history

## histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

=======
- has_many :historys
- has_one :deliverys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| explanation  | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| leadtime_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- has_one_attached :image
- has_many :historys, dependent: :destroy

## historys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false,                   |
| user      | references | null: false, foreign_key: true |

>>>>>>> Stashed changes
### Association

- belongs_to :user
- belongs_to :item
<<<<<<< Updated upstream
- has_one :delivery

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| build_name       | string     |                                |
| telephone_number | string     | null: false                    |
| history          | references | null: false, foreign_key: true |


### Association

- belongs_to :history
=======

## deliverys テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| post_code        | integer | null: false |
| city             | string  | null: false |
| address          | string  | null: false |
| build_name       | string  |             |
| telephone_number | integer | null: false |

### Association

- belongs_to :user
>>>>>>> Stashed changes
