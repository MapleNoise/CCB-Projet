# coding:utf-8
class Section < ActiveRecord::Base
  validates_presence_of :titre
  validates :titre, length: { minimum: 4 , too_short: "Le minimum requis est de %{count} caractères"} , uniqueness: true
  validates :titre, length: { maximum: 50 , too_long: "Le maximum requis est de %{count} caractères"}

  belongs_to :formation
  has_many :chapitre

  # Gestion de la suppression d'un produit
  def delete!
    update_attribute(:dateSuppression, Time.now)
  end

end
