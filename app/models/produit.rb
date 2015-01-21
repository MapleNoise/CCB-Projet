class Produit < ActiveRecord::Base
  validates_presence_of :ref, :nom, :prix
  validates :prix, :numericality => { :greater_than_or_equal_to => 0 }
  validates :ref, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caracteres"} , uniqueness: true
  validates :ref, length: { maximum: 20 , too_long: "Le maximum requis est de %{count} caracteres"}

  has_many :categories_produits
  has_many :categories, :through  => :categories_produits
  has_many :fiche_produits
  #belongs_to :Coach
  #has_many :Chapitre
  has_one :type_produits
  
  # Gestion de la suppression d'un produit
  def delete!
    update_attribute(:dateSuppression, Time.now)
  end
    

  def init!
    self.ref = Digest::MD5.hexdigest((Time.now).strftime("%Y%m%dT%H%M%S%L%z"))[10..25]
  end
#  validates_associated :typeproduits
end
