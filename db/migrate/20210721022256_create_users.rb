class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|

      t.string :nickname,            null: false, foreign_key: true
      t.string :email,               null: false
      t.string :encrypted_password,  null: false
      t.string :c_family_name,       null: false
      t.string :c_first_name,        null: false
      t.string :k_family_name,        null: false
      t.string :k_first_name,        null: false
      t.date   :birthday,            null: false


      t.timestamps
    end
  end
end
