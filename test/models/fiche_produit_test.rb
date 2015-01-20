require 'test_helper'

class FicheProduitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "La ref doit etre presente" do
  	fp = FicheProduit.create(titre: "azerty",  descriptionCourte: "222222")
  	assert_not fp.save
  end

  test "Le titre doit etre present" do
  	fp = FicheProduit.create(ref: "azerty",  descriptionCourte: "222222")
  	assert_not fp.save
  end
  
  test "La descriptionCourte doit etre presente" do
  	fp = FicheProduit.create(titre: "azerty",  ref: "222222")
  	assert_not fp.save
  end

  test "La descriptionCourte doit etre plus >= 6" do
  	fp = FicheProduit.create(titre: "azerty",  ref: "222222", descriptionCourte: "aaa")
  	assert_not fp.save
  end

    test "La descriptionCourte doit etre <200 " do
  	fp = FicheProduit.create(titre: "azerty",  ref: "222222", descriptionCourte: "a" * 201)
  	assert_not fp.save
  end

  test "La ref doit etre plus >= 6" do
  	fp = FicheProduit.create(titre: "azerty",  ref: "a", descriptionCourte: "a" * 30)
  	assert_not fp.save
  end

    test "La ref doit etre <20 " do
  	fp = FicheProduit.create(titre: "azerty",  ref: "a" * 21, descriptionCourte: "a" * 30)
  	assert_not fp.save
  end

  test "Le titre doit etre plus >= 6" do
  	fp = FicheProduit.create(titre: "a" * 2,  ref: "222222", descriptionCourte: "aaa")
  	assert_not fp.save
  end

    test "Le titre doit etre <50 " do
  	fp = FicheProduit.create(titre: "a" * 51,  ref: "222222", descriptionCourte: "a" * 201)
  	assert_not fp.save
  end

  test "La description doit etre plus >= 10" do
  	fp = FicheProduit.create(titre: "a" * 7,  ref: "222222", descriptionCourte: "aaa", description: "a" * 9)
  	assert_not fp.save
  end

    test "La description doit etre <800 " do
  	fp = FicheProduit.create(titre: "a" * 7,  ref: "222222", descriptionCourte: "a" * 20, description: "a" * 801)
  	assert_not fp.save
  end

    test "Le delete doit changer la date de suppression" do
  	fp = FicheProduit.create(titre: "a" * 2,  ref: "222222", descriptionCourte: "a" * 20)
  	fp.save
  	fp.delete!
  	assert_not fp.dateSuppression == nil
  end

end
