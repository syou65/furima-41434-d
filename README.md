# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| katakana_full_name | string | null: false |
| katakana_name      | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many :items
- has_many :purchases



# items　テーブル
| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| user                  | references  | null: false, foreign_key: true |
| title                 | string | null: false |
| detail                | text      | null: false |
| category_id           | integer   | null: false |
| situation_id          | integer   | null: false |
| shipping_charge_id    | integer   | null: false |
| prefecture_id         | integer   | null: false |
| shipping_day_id       | integer   | null: false |
| price                 | integer   | null: false |

### Association
- belongs_to :user
- has_one    :purchase 

# orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchase           | references  | null: false, foreign_key: true |
| postal_code        | string| null: false  |
| prefecture_id      | integer| null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| building_name      | string |
| telephone_number   | string | null: false |

### Association
- belongs_to :purchase


# purchases テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :order

