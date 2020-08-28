class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company_title
      t.string :bio
      t.string :photo

      t.timestamps
    end
  end
end
