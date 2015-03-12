class Tag < ActiveRecord::Base

  validates_presence_of :nom
  validates :nom, length: { minimum: 4 , too_short: "Le minimum requis est de %{count} caracteres"}
  validates :nom, length: { maximum: 50 , too_long: "Le maximum requis est de %{count} caracteres"}

  has_and_belongs_to_many :produits
  has_and_belongs_to_many :formations
  #has_many :categories_produits
  #has_many :produit, :through  => :categories_produits
  # Gestion de la suppression d'un produit
  def delete!
    if(:dateSuppression == nil)
      update_attribute(:dateSuppression, Time.now)
    end
  end

end
