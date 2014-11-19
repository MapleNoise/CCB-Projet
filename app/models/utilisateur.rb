class Utilisateur < ActiveRecord::Base
  rolify :before_add => :before_add_method
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_confirmation_of :email, message: "Les mails doivent etre identiques"
  validates_presence_of :nom, :prenom, :email_confirmation#, :password_confirmation
  
  def before_add_method(role)
    if not self.has_role? :admin or self.has_role? :coach
      self.add_role :utilisateur
    else 
      self.add_role :utilisateur
    end
    
  end
  
end
