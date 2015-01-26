class Reponse < ActiveRecord::Base
  
  
  has_one :question
  
  # Gestion de la suppression d'un produit
  def delete!
    update_attribute(:dateSuppression, Time.now)
  end
  
end
