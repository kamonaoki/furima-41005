# テーブル設計

## users テーブル

| Column     | Type       | Options      |
| ------     | ---------- | -------------|
| nickname   | string     | null: false  |
| email      | string     | null: false  |
| password   | string     | null: false  |
| name_kanji | string     | null: false  |
| name_kana  | string     | null: false  |
| birth_date | string     | null: false  |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options      |
| ------        | ---------- | -------------|
| item_name     | string     | null: false  |
| category      | string     | null: false  |
| price         | string     | null: false  |
| detail        | text       | null: false  |
| condition     | string     | null: false  |
| burden        | string     | null: false  |
| ship_from     | string     | null: false  |
| delivery_date | string     | null: false  |
| user_id       | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :order

# orders テーブル

| Column     | Type       | Options                         |
| ------     | ---------- | ------------------------------  |
| item_id    | references | null: false, foreign_key: true  |
| user_id    | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :send

## sends テーブル

| Column          | Type       | Options      |
| ------          | ---------- | -------------|
| post_code       | string     | null: false  |
| prefectures     | string     | null: false  |
| city            | string     | null: false  |
| street_address  | string     | null: false  |
| building_name   | string     | null: false  |
| telephone       | string     | null: false  |

### Association
- belongs_to :order



