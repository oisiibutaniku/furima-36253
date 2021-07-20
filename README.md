## テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |ニックネーム
| email              | string | unique: true, null: false      |メールアドレス
| encrypted_password | string | null: false                    |パスワード
| c_family_name      | string | null: false                    |姓
| c_first_name       | string | null: false                    |名
| k_family_name      | string | null: false                    |セイ
| k_first_name       | string | null: false                    |メイ
| birthday           | date   | null: false                    |生年月日(プルダウン)

Association
- has_many :comments
- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| user                | references | null: false foreign_key: true|ユーザー
| product             | string     | null: false                  |商品名
| explanation         | text       | null: false                  |説明
| category_id         | integer    | null: false                  |カテゴリ(プルダウン)
| state_id            | integer    | null: false                  |状態(プルダウン)
| burden_id           | integer    | null: false                  |負担金額(プルダウン)
| area_id             | integer    | null: false                  |発送地域(プルダウン)
| day_id              | integer    | null: false                  |発送日数(プルダウン)
| price               | integer    | null: false                  |値段

Association
- has_many   :comments
- belongs_to :user
- has_one  :purchase


##  purchasesテーブル

| Column              | Type   | Options     |
| ------------------- | ---------- | ----------- |
| item                | references | null: false foreign_key: true|商品
| user                | references | null: false foreign_key: true|ユーザー
| number              | integer    | null: false                  |番号
| expiration_month    | integer    | null: false                  |有効期限(月)
| expiration_year     | integer    | null: false                  |有効期限(年)
| security_code       | integer    | null: false                  |セキュリティコード

Association
- belongs_to :user
- belongs_to :item


## addressesテーブル

| Column              | Type   | Options     |
| ------------------- | ---------- | ----------- |
| Postal_code         | integer    | null: false |郵便番号
| prefecture          | integer    | null: false |都道府県(プルダウン)
| city                | string     | null: false |市町村
| street              | string     | null: false |番地
| building            | string     | null: false |建物
| phone               | integer    | null: false |電話番号

Association


## comments テーブル

| Column    | Type       | Options                      |
| ------    | ---------- | ---------------------------- |
| text      | text       | null: false                  |コメント
| user      | references | null: false foreign_key: true|ユーザー
| items     | references | null: false foreign_key: true|商品

Association

- belongs_to :user
- belongs_to :item

