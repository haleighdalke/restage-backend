class ArtistSerializer < ActiveModel::Serializer 
  include Rails.application.routes.url_helpers

  attributes :id, :company_title, :bio, :photo
  has_one :user

  def initialize(artist_object)
    @artist = artist_object
  end
 
  def to_serialized_json
    options = {
      :include => {
        :user => {:only => [:id, :name, :username]}
      }, :except => [:user_id, :updated_at, :created_at]
    }
    @artist.to_json(options)
  end

end
