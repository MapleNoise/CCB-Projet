class Utilisateur2 < ActiveRecord::Base

  before_save { self.email = email.downcase }
  #before_filter :save_login_state, :only => [:new, :create]
  validates :prenom, presence: true
  validates :nom, presence: true

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: { maximum: 255 },
    format: { with: EMAIL_REGEX },
    uniqueness: true,
    confirmation: true

  has_one :fonctions

  validates :password, length: { minimum: 8, too_short: "C'est trop court" }
  has_secure_password

end
