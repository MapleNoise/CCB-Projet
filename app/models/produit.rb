class Produit < ActiveRecord::Base
  validates_presence_of :ref, :nom, :prix
  validates :prix, :numericality => { :greater_than_or_equal_to => 0 }
  validates :ref, length: { minimum: 6 , too_short: "Le minimum requis est de %{count} caracteres"} , uniqueness: true
  validates :ref, length: { maximum: 20 , too_long: "Le maximum requis est de %{count} caracteres"}
  
  after_initialize :init

    def init
      self.dateCreation  ||= Time.now
    end
    
    def update(params)
      params[:dateModification] = Time.now
      update_attributes(params)
    end
    
    # Gestion de la suppression d'un produit
    def delete!
      update_attribute(:dateSuppression, Time.now)
    end
    
#  validates_associated :typeproduits
end
