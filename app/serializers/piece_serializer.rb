class PieceSerializer < ActiveModel::Serializer
  attributes :id, :title, :cover_photo, :description, :trailer_id, :full_video_id
  has_one :artist
  has_one :festival

  def initialize(piece_object)
    @piece = piece_object
  end
 
  def to_serialized_json
    options = {
      :include => {
        :artist => {:only => [:id, :company_title]},
        :festival => {:only => [:id, :title, :description, :release_date]}
      }, :except => [:artist_id, :festival_id, :updated_at, :created_at]
    }
    @piece.to_json(options)
  end

end
