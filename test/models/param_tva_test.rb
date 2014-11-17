require 'test_helper'

class ParamTvaTest < ActiveSupport::TestCase
  
  test "the truth" do
    assert true
  end
  
  test "ne_pas_enregister_une_TVA_sans_label" do
    tva = ParamTVA.new
    assert_not tva.save
  end
  
  test "ne_pas_enregister_une_TVA_sans_valeur" do
    tva = ParamTVA.new
    assert_not tva.save
  end
  
end
