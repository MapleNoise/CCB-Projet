class ExtensionFichier < ActiveRecord::Base
  has_and_belongs_to_many :type_produits
end
