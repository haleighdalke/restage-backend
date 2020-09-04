class Admin < ApplicationRecord
  belongs_to :user
  has_many :festivals
  has_many :artists, through: :festivals
  has_many :pieces, through: :festivals

  validates :user_id, uniqueness: { case_sensitive: false }
  validates :user_id, :title, :authorization_code, presence: true

  def getName
    self.user.name
  end

end
