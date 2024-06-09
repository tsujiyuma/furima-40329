# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# users_table
|Column             |Type           |Options|
|nickname           |string         |null:false|
|email              |string         |null: false, unique: true|
|encrypted_password |string         |null:false|
|family_name_kanji  |string         |null:false|
|first_name_kanji   |string         |null:false|
|family_name_kana   |string         |null:false|
|first_name_kana    |string         |null:false|
|birthday           |date           |null:false|
### Asosiataion
- has_many　:items
- has_many  :orders


# items_table
|Column             |Type           |Options|
|user               |references     |null:false, foreign_key:true|
|name               |string         |null:false|
|description        |text           |null:false|
|category_id        |interger       |null:false|
|status_id          |interger       |null:false|
|shipping_fee_id    |interger       |null:false|
|prefecuture_id     |interger       |null:false|
|shippng_day_id     |interger       |null:false|
|price              |integer        |null:false|
### Asosiation
- belongs_to　:user
- has_one :order


# orders_table
|Column             |Type           |Options|
|user               |references     |null:false, foreign_key:true|
|order              |references     |null:false, foreign_key:true|
### Asosiation
- belongs_to :user
- belongs_to :item
- has_one :purchase

# purchases_table
|Column             |Type           |Options|
|order              |references     |null:false, foreign_key:true|
|post_code          |string         |null:false|
|prefecuture_id     |interger       |null:false|
|municipality       |string         |null:false|
|street_addres      |string         |null:false|
|building_name      |string         |       |
|photo_num          |string         |null:false|
### Asosiation
- belongs_to :order