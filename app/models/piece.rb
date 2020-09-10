require_relative('../../quickstart.rb')
require 'byebug'

class Piece < ApplicationRecord
  belongs_to :artist
  belongs_to :festival

  has_one_attached :image

  validates :artist_id, :title, :description, :trailer_id, :full_video_id, presence: true


  def upload_trailer(short_video)

    id = upload_video(getService(), short_video, self.title, self.description)

    # call api
      # upload videos
      # process request
      # return id

      self.trailer_id = id
  end

  def upload_full_video(long_video)

    id = upload_video(getService(), long_video, self.title, self.description)

    # call api
      # upload videos
      # process request
      # return id

      self.full_video_id = id
  end

end
