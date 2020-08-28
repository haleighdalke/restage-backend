class AdminSerializer < ActiveModel::Serializer
  attributes :id, :authorization_code, :title
  has_one :user
end
