# テーブル設計

## users テーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | -------------|
| nickname           | string     | null: false  |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false  |
| last_name          | string     | null: false  |
| first_name         | string     | null: false  |
| last_name_kana     | string     | null: false  |
| first_name_kana    | string     | null: false  |
| birth_date         | date       | null: false  |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | -------------|
| item_name        | string     | null: false  |
| category_id      | integer    | null: false  |
| price            | string     | null: false  |
| detail           | text       | null: false  |
| condition_id     | integer    | null: false  |
| burden_id        | integer    | null: false  |
| prefectures_id   | integer    | null: false  |
| delivery_date_id | integer    | null: false  |
| user             | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :order

# orders テーブル

| Column     | Type       | Options                         |
| ------     | ---------- | ------------------------------  |
| item       | references | null: false, foreign_key: true  |
| user       | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :send

## sends テーブル

| Column          | Type       | Options      |
| ------          | ---------- | -------------|
| post_code       | string     | null: false  |
| prefectures_id  | integer    | null: false  |
| city            | string     | null: false  |
| street_address  | string     | null: false  |
| building_name   | string     |              |
| telephone       | string     | null: false  |
| order           | references | null: false, foreign_key: true  |

### Association
- belongs_to :order



