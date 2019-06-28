class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title, null: false, length: 100
      t.text :body, null: false, length: 1000
      t.integer :evaluation, null: false
      t.references :cd, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:cd_id, :user_id], unique: true

  end
end
