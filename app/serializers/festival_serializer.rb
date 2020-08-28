class FestivalSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cover_photo, :application_start_date, :application_end_date, :release_date, :video_list
  has_one :admin
end
