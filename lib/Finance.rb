#encoding: UTF-8
# Classe permettant de créer toutes les méthodes pour gérer les calculs financiers
module Finance
  
  # Arrondi à l'inférieur, avec le nombre de décimal max demandé
  def arrondisBas(base, decimal = 2)
    multi = 10. ** decimal
    return ((base * multi).floor).to_f/multi.to_f
  end
  
  # Arrondi au supérieur, avec le nombre de décimal max demandé
  def arrondisHaut(base, decimal = 2)
    multi = 10. ** decimal
    return ((base * multi).ceil).to_f/multi.to_f
  end
  
  # Applique une réduction en pourcentage
  def reductionPourcentage(base, pourcentage, decimal = 2, arrondisBas = true)
    res = -1
    if arrondisBas == true
      res = arrondisBas(base * pourcentage, decimal)
    else
      res = arrondisHaut(base * pourcentage, decimal)
    end
    
    return res
    
  end
  
  
  
end