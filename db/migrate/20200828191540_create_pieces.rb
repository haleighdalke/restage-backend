class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :festival, null: false, foreign_key: true
      t.string :title
      t.string :cover_photo
      t.string :description
      t.string :trailer_id
      t.string :full_video_id

      t.timestamps
    end
  end
end
