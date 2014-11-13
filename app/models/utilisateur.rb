class Utilisateur < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_confirmation_of :mail, message: "Les mails doivent etre identiques"
  validates_presence_of :nom, :prenom, :mail_confirmation, :password_confirmation
end
