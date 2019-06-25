class RemoveGenreFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :Genre_id, :integer
  end
end
