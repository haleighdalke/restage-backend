class Piece < ApplicationRecord
  belongs_to :artist
  belongs_to :festival

  has_one_attached :short_video
  has_one_attached :long_video
  has_one_attached :image
  # validates :artist_id, :title, :cover_photo, :description, :trailer_id, :full_video_id, presence: true

end
