# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Categories_produits < ActiveRecord::Base
  #validates_presence_of :idProduit, :idCategorie
 
  belongs_to :produit
  belongs_to :categories
  
end
