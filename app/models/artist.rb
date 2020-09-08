class Artist < ApplicationRecord
  belongs_to :user
  has_many :pieces
  has_many :festivals, through: :pieces

  # one user, unique company title, short bio
  validates :user_id, uniqueness: { case_sensitive: false }
  validates :company_title, uniqueness: { case_sensitive: false }
  validates :company_title, length: {maximum: 100}
  validates :bio, length: {maximum: 500}
  validates :user_id, :company_title, :bio, :photo, presence: true


  def getName
    self.user.name
  end

end
