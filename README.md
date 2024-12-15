# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| full_name          | string | null: false |
| katakana_name      | string | null: false |
| birth_date         | string | null: false |




# items　テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references  | null: false, foreign_key: true |
| title              | string | null: false |
| catch_copy         | text   | null: false |
| detail             | text   | null: false |
| category           | text   | null: false |
| situation          | text   | null: false |
| Shipping_charge    | text   | null: false |
| Shipping_area      | text   | null: false |
| Shipping days      | text   | null: false |

# orders テーブル
| Column             | Type   | Options     |
| postal_code        | string | null: false |
| prefecture         | integer| null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| building_name      | string | null: false |
| telephone number   | string | null: false |


