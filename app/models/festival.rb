class Festival < ApplicationRecord
  belongs_to :admin
  has_many :pieces
  has_many :artists, through: :pieces
end
