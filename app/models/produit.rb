#encoding: utf-8
class Produit < ActiveRecord::Base

  ################################
  #             INFO
  # Pour récupérer la liste des tags : produit.tags ça retourne un tableau de tags
  ################################

  validates_presence_of :ref, :nom, :prix, :description, :descriptionCourte, :urlFichier
  validates :prix, :numericality => { :greater_than_or_equal_to => 0 }
  validates :ref, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caractères"} , uniqueness: true
  validates :ref, length: { maximum: 20 , too_long: "Le maximum requis est de %{count} caractères"}
  validates :description, length: { minimum: 10 , too_short: "Le minimum requis est de %{count} caractères"}
  validates :description, length: { maximum: 800 , too_long: "Le maximum requis est de %{count} caractères"}
  validates :descriptionCourte, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caractères"}
  validates :descriptionCourte, length: { maximum: 200 , too_long: "Le maximum requis est de %{count} caractères"}

  # Ajout de la gestion urlFichier
  mount_uploader :urlFichier, FichierGeneralUploader
  mount_uploader :image, ImageProduitUploader

  has_and_belongs_to_many :tags
  #has_many :categories_produits
  #has_many :categories, :through  => :categories_produits
  #belongs_to :Coach
  #has_many :Chapitre
  has_one :type_produits
  has_one :utilisateur2
  has_and_belongs_to_many :utilisateur2s
  
  # Gestion de la suppression d'un produit
  def delete!
    if(:dateSuppression == nil)
      update_attribute(:dateSuppression, Time.now)
    end
  end

  def achat
  end

  # Initialise l'instance de produit pour générer une référence.
  # Il faut voir quel format de référence est souhaité.
  def init!
    self.ref = Digest::MD5.hexdigest((Time.now).strftime("%Y%m%dT%H%M%S%L%z"))[10..25].encode("utf-8")
  end

end
