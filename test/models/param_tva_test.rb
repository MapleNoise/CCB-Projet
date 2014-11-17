require 'test_helper'

class ParamTvaTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end
  
  test "ne_pas_enregister_une_TVA_sans_label" do
    tva ||= ParamTva.new
    assert_not tva.save
  end
  
  test "ne_pas_enregister_une_TVA_sans_valeur" do
    tva ||= ParamTva.new
    assert_not tva.save
  end
  
  test "ajout_nouvelle_tva_doit_etre_ok" do
    tva ||= ParamTva.create(valeur: 19.6, label: "TVA label")
    assert tva.save
  end
  
  test "getValideTVA_doit_retourne_une_seule_TVA" do
#    tva ||= ParamTva.create(valeur: 19.6, label: "TVA label")
#    tva.save
    tva2 ||= ParamTva.create(valeur: 19.6, label: "TVA label")
    tva2.save
    tva2.delete!
    
    res ||= ParamTva.new.getValideTVA
    
    puts "length : " + res.length.to_s
    
  end
  
end
