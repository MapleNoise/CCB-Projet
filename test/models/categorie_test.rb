require 'test_helper'

class CategorieTest < ActiveSupport::TestCase
  
  test "Ne pas enregistrer une Categorie sans nom" do
  	c = Categorie.create()
  	assert_not c.save
  end

  test "Le nom est trop court" do
  	c = Categorie.create(nom: "aa")
  	assert_not c.save
  end

  test "Le nom est trop long" do
  	#60 x "a"
  	c =  Categorie.create(nom: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  	assert_not c.save
  end

  test "Doit etre unique" do
  	c = Categorie.create(nom: "Categorie1")
  	cDup = Categorie.create(nom: "Categorie1")
  	c.save
  	assert_not cDup.save
  end

  test "Delete qui ne supprime pas mais change juste la date" do
  	c = Categorie.create(nom: "Categorie1")
  	c.save
  	c.delete!
  	assert c.dateSuppression != nil
  end	


end
