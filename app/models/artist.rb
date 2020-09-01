class Artist < ApplicationRecord
  belongs_to :user
  has_many :pieces
  has_many :festivals, through: :pieces

  validates :company_title, uniqueness: { case_sensitive: false }


  def getName
    self.user.name
  end

end
