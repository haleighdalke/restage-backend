class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: { case_sensitive: false }
    validates :username, length: {maximum: 20}
    
    has_many :artists
    has_many :admins

end
