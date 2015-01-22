class Utilisateur2 < ActiveRecord::Base

  before_save { self.email = email.downcase }
  #before_filter :save_login_state, :only => [:new, :create]
  validates :name, presence: true
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
    length: { maximum: 255 },
    format: { with: EMAIL_REGEX },
    uniqueness: true


  validates :password, length: { minimum: 8, too_short: "C'est trop court" }
  has_secure_password
  
  def self.authenticate(username_or_email="", login_password="")
    if EMAIL_REGEX.match(username_or_email)
      user = Utilisateur2.find_by_email(username_or_email)
    else
      user = Utilisateur2.find_by_username(username_or_email)
    end
    if user && user.match_password(login_password)
      return user 
    else
      return false
    end
  end
  
  
  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end 
  
  
end
