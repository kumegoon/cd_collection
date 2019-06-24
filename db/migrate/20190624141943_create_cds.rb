class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :title, null: false, length: 50
      t.string :artist_name, null: false, length: 50
      t.integer :price, null: false
      t.text :description, null: false, length: 500
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
