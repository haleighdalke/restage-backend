class Admin < ApplicationRecord
  belongs_to :user
  has_many :festivals
  has_many :artists, through: :festivals
  has_many :pieces, through: :festivals

  validates :user_id, uniqueness: { case_sensitive: false }
  validates :user_id, :title, presence: true
  validates :authorization_code, inclusion: { in: %w(dockingbay94),
    message: "%{value} is not a valid code" }

  def getName
    self.user.name
  end

end
