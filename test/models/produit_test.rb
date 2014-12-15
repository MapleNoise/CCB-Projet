require 'test_helper'

class ProduitTest < ActiveSupport::TestCase

	test "Presence de ref" do
		pt = Produit.create(nom: "name", prix: 0)
		assert_not pt.save
	end

	test "Presence de nom" do
		pt = Produit.create(ref: "a" * 7, prix: 0)
		assert_not pt.save
	end

	test "Presence de prix" do
		pt = Produit.create(ref: "a" * 7, nom: "name")
		assert_not pt.save
	end

	test "Prix est un nombre" do
		pt = Produit.create(ref: "a" * 7, nom: "name", prix:"p")
		assert_not pt.save
	end

	test "Prix est un nombre >= 0" do
		pt = Produit.create(ref: "a" * 7, nom: "name", prix: -1)
		assert_not pt.save
	end

	test "Ref.lenght >= 6" do
		pt = Produit.create(nom: "name", prix: 0, ref: "a"*5)
		assert_not pt.save
	end

	test "Ref.lenght < 20" do
		pt = Produit.create(nom: "name", prix: 0, ref: "a"*21)
		assert_not pt.save
	end

	test "save normal" do
		pt = Produit.create(nom: "name", prix: 0, ref: "a"*6)
		assert pt.save
	end

end
