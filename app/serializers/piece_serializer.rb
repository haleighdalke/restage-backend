class PieceSerializer < ActiveModel::Serializer
  attributes :id, :title, :cover_photo, :description, :trailer_id, :full_video_id
  has_one :artist
  has_one :festival
end
