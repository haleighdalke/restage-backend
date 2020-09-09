class ArtistSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :company_title, :bio, :photo
  # , :headshot
  has_one :user
  # has_one_attached :headshot

  def initialize(artist_object)
    @artist = artist_object
    # if @artist.headshot
    #   headshot = rails_blob_path(@artist.headshot, disposition: "attachment", only_path: true)
    # end
  end

  # def headshot
  #   byebug
  #   return rails_blob_path(artist.headshot, disposition: "attachment", only_path: true)
  # end
  
  # def headshot_url
  #   variant = @artist.headshot.variant(resize: "300x300")
  #   return rails_representation_url(variant, only_path: true)
  # end
 
  def to_serialized_json
    options = {
      :include => {
        :user => {:only => [:id, :name, :username]}
      }, :except => [:user_id, :updated_at, :created_at]
    }
    @artist.to_json(options)
  end

end
