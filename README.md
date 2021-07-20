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
| prefecture_id       | integer    | null: false                  |発送地域(プルダウン)
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

Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column              | Type   | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | string     | null: false                  |郵便番号
| prefecture_id       | integer    | null: false                  |都道府県(プルダウン)
| city                | string     | null: false                  |市町村
| street              | string     | null: false                  |番地
| building            | string     |                              |建物
| phone               | string     | null: false                  |電話番号
| purchase            |references  | null: false foreign_key: true|購入履歴

Association
- belongs_to :purchase



## comments テーブル

| Column    | Type       | Options                      |
| ------    | ---------- | ---------------------------- |
| text      | text       | null: false                  |コメント
| user      | references | null: false foreign_key: true|ユーザー
| item      | references | null: false foreign_key: true|商品

Association

- belongs_to :user
- belongs_to :item

