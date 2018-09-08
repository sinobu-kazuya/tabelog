## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|time|integer|null: false|
|price|integer|null: false|
|rate |integer|null: false|
|food_rate |integer|null: false|
|service_rate|integer|null: false|
|atomosphier_rate|integer|null: false|
|cp_rate|integer|null: false|
|drink_rate|integer|null: false|
|title|string|null: false|
|text|text|null: false|
|images|references||
|visit_day|datetime|null: false|
|share_with|integer|null: false|

### Association
- belongs_to :user
- has_many :likes
- has_many :images
- belongs_to :shop
- has_many :review-tags
