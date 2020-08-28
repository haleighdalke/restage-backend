class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :company_title, :bio, :photo
  has_one :user
end
