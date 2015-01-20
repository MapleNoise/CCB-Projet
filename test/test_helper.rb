ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  
  set_fixture_class :categories => Categorie
  set_fixture_class :fiche_produits => FicheProduit
  
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :categories
  fixtures :fiche_produits
  fixtures :produits
  fixtures :type_produits
  #fixtures :all

  # Add more helper methods to be used by all tests here...
end
