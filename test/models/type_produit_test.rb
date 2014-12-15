require 'test_helper'

class TypeProduitTest < ActiveSupport::TestCase

	test "Presence de nom" do
		pt = TypeProduit.create()
		assert_not pt.save
	end

	test "Nom < 4" do
		pt = TypeProduit.create(nom: "a")
		assert_not pt.save
	end

	test "Nom > 41" do
		pt = TypeProduit.create(nom: "a" * 41)
		assert_not pt.save
	end

	test "Nom > 4 && < 40" do
		pt = TypeProduit.create(nom: "a" * 6)
		assert pt.save
	end

end
