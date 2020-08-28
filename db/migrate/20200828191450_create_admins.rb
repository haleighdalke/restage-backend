class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.references :user, null: false, foreign_key: true
      t.string :authorization_code
      t.string :title

      t.timestamps
    end
  end
end
