class Utilisateur2 < ActiveRecord::Base

  before_save { self.email = email.downcase }

  validates :name, presence: true
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: true


  validates :password, length: { minimum: 8, too_short: "C'est trop court" }
  has_secure_password
end
