class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :photo, :string
  end
end
