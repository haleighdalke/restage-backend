class Admin < ApplicationRecord
  belongs_to :user
  has_many :festivals
  has_many :artists, through: :festivals
  has_many :pieces, through: :festivals
end
