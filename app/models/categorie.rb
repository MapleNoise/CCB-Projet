class Categorie < ActiveRecord::Base
  
  validates_presence_of :nom, :mere
  validates :nom, length: { minimum: 4 , too_short: "Le minimum requis est de %{count} caracteres"} , uniqueness: true
  validates :nom, length: { maximum: 50 , too_long: "Le maximum requis est de %{count} caracteres"}
  
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
end
