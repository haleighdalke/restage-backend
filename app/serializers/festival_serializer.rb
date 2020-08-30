class FestivalSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cover_photo, :application_start_date, :application_end_date, :release_date, :video_list, :pieces
  has_one :admin

  def initialize(festival_object)
    @festival = festival_object
  end
 
  def to_serialized_json
    options = {
      :include => {
        :admin => {:only => [:id]},
        :pieces => {:only => [:id, :title]}
      }, :except => [:admin_id, :updated_at, :created_at, :application_start_date, :application_end_date, :video_list]
    }
    @festival.to_json(options)
  end

end

# extra attributes for pieces: , :cover_photo, :description, :trailer_id, :full_video_id