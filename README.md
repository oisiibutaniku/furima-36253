## テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |ニックネーム
| email               | string | null: false |メールアドレス
| encrypted_password  | string | null: false |パスワード
| c_family_name       | string | null: false |姓
| c_first_name        | string | null: false |名
| k_family_name       | string | null: false |セイ
| k_first_name        | string | null: false |メイ
| birth_year          | integer| null: false |生年(プルダウン)
| birth_month         | integer| null: false |月(プルダウン)
| birth_day           | integer| null: false |日(プルダウン)

Association
- has_many :comments
- has_many :items
- has_one  :credit_cord

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| image               |        |             |画像
| product             | string | null: false |商品名
| explanation         | text   | null: false |説明
| category            | integer| null: false |カテゴリ(プルダウン)
| state               | integer| null: false |状態(プルダウン)
| burden              | integer| null: false |負担金額(プルダウン)
| area                | integer| null: false |発送地域(プルダウン)
| day                 | integer| null: false |発送日数(プルダウン)
| price               | integer| null: false |値段
| favorite            | integer| null: false |お気に入り

Association
- has_many   :comments
- belongs_to :user


## credit_cordsテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| number              | integer    | null: false |番号
| expiration_month    | integer    | null: false |有効期限(月)
| expiration_year     | integer    | null: false |有効期限(年)
| security_code       | integer    | null: false |セキュリティコード
| Postal_code         | integer    | null: false |郵便番号
| prefecture          | integer    | null: false |都道府県(プルダウン)
| city                | string     | null: false |市町村
| street              | string     | null: false |番地
| building            | string     | null: false |建物
| phone               | integer    | null: false |電話番号

Association
- belongs_to :user

## comments テーブル

| Column    | Type       | Options                      |
| ------    | ---------- | ---------------------------- |
| text      | text       | null: false                  |コメント
| user      | references | null: false foreign_key: true|ユーザー
| items     | references | null: false foreign_key: true|商品

Association

- belongs_to :user
- belongs_to :item

