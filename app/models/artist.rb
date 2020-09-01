class Artist < ApplicationRecord
  belongs_to :user
  has_many :pieces
  has_many :festivals, through: :pieces

  def getName
    self.user.name
  end
  
end
