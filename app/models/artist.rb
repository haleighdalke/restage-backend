class Artist < ApplicationRecord
  belongs_to :user
  has_many :pieces
  has_many :festivals, through: :pieces
end
