class CreateFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :festivals do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :cover_photo
      t.string :application_start_date
      t.string :application_end_date
      t.string :release_date
      t.string :video_list

      t.timestamps
    end
  end
end
