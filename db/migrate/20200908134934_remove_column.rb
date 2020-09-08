class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :photo
  end
end
