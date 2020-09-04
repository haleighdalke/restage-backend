class Piece < ApplicationRecord
  belongs_to :artist
  belongs_to :festival

  # validates :artist_id, :title, :cover_photo, :description, :trailer_id, :full_video_id, presence: true

end
