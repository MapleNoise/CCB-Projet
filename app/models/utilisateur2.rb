class Utilisateur2 < ActiveRecord::Base
  attr_accessor :old_password
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
  has_many :produits

  validates :password, length: { minimum: 8, too_short: "C'est trop court" }, on: :update, allow_blank: true
  has_secure_password

  def isExpert?
    Fonction.find_by(:id => self.fonctionId).nom == "Expert"
  end

  def isAdmin?
    Fonction.find_by(:id => self.fonctionId).nom == "Administrateur"
  end
  
  def isClient?
    Fonction.find_by(:id => self.fonctionId).nom == "Client"
  end
  
  def MapSite
    
  end
  def to_string
    puts "--------------------USER---------------------"
    puts self.id
    puts self.nom
    puts self.prenom
    puts self.email
    puts "--------------------USER---------------------"
  end

  
end
