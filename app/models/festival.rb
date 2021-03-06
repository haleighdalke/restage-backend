class Festival < ApplicationRecord
  belongs_to :admin
  has_many :pieces
  has_many :artists, through: :pieces

  validates :admin_id, :title, :description, :cover_photo, :application_start_date, :application_end_date, :release_date, presence: true
  validates :piece_id, uniqueness: { case_sensitive: false }
end
