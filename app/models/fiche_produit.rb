class FicheProduit < ActiveRecord::Base
  validates_presence_of :ref, :titre, :descriptionCourte
  validates :ref, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caracteres"} , uniqueness: true
  validates :ref, length: { maximum: 20 , too_long: "Le maximum requis est de %{count} caracteres"}
  validates :titre, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caracteres"}
  validates :titre, length: { maximum: 50 , too_long: "Le maximum requis est de %{count} caracteres"}
  validates :description, length: { minimum: 10 , too_short: "Le minimum requis est de %{count} caracteres"}
  validates :description, length: { maximum: 800 , too_long: "Le maximum requis est de %{count} caracteres"}
  validates :descriptionCourte, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caracteres"}
  validates :descriptionCourte, length: { maximum: 200 , too_long: "Le maximum requis est de %{count} caracteres"}

  # Gestion de la suppression d'un produit
  def delete!
    update_attribute(:dateSuppression, Time.now)
  end
end
