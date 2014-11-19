class Utilisateur < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_confirmation_of :email, message: "Les mails doivent etre identiques"
  validates_presence_of :nom, :prenom, :email_confirmation, :password_confirmation
  validates_uniqueness_of :email
end
