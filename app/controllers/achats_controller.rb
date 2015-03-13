class AchatsController < ApplicationController
  def acheter
    @produits = Produit.new
    @produits = Produit.find_by(:id => prod_id_params)
    
    @utilisateur = Utilisateur2.find_by(:id => session['user_id'])
    @produit.utilisateur2s << @utilisateur
    @poduits.save
    
     puts "CESTTTTTTTTTTTTTTTTTTTTTTT AAAAAAACHHHHHEETTTTTTTTTTERRRR//// / / / //// /// /////"
  end
  
   def prod_id_params
      params.require(:prod)
  end
  
end
