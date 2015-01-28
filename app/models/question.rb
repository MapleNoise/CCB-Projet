class Question < ActiveRecord::Base
    validates_presence_of :nom
  validates :nom, length: { minimum: 4 , too_short: "Le minimum requis est de %{count} caracteres"} , uniqueness: true
  validates :nom, length: { maximum: 50 , too_long: "Le maximum requis est de %{count} caracteres"}

  has_one :quizz
  has_many :reponse
  # Gestion de la suppression d'un produit
  def delete!
    update_attribute(:dateSuppression, Time.now)
  end
end
