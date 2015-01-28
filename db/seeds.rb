#encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Création de deux Type de fichier.
#typeProduits = TypeProduit.create([{nom: "Fichier Excel"}, {nom: "Fichier Word"}])

# Association de deux formats pour les fichiers Excels
ExtensionFichier.create(extension: ".xls")#, type_produits_id: TypeProduit.find_by(:nom => "Fichier Excel").id)
ExtensionFichier.create(extension: ".csv")#, type_produits_id: TypeProduit.find_by(:nom => "Fichier Excel").id)

# Association de quatres formations pour les fichiers Words
ExtensionFichier.create(extension: ".doc")#, type_produits_id: TypeProduit.find_by(:nom => "Fichier Word").id)
ExtensionFichier.create(extension: ".docx")#, type_produits_id: TypeProduit.find_by(:nom => "Fichier Word").id)
ExtensionFichier.create(extension: ".rtf")#, type_produits_id: TypeProduit.find_by(:nom => "Fichier Word").id)
ExtensionFichier.create(extension: ".docm")#, type_produits_id: TypeProduit.find_by(:nom => "Fichier Word").id)

TypeProduit.create(
  nom: "Fichier Excel",
  :extension_fichiers => ExtensionFichier.where(:extension => [".xls", ".csv"]))

TypeProduit.create(
	nom: "Fichier Word",
	:extension_fichiers => ExtensionFichier.where(:extension => [".doc", ".docx", ".rtf", ".docm"]))

# Création des catégories de bases
Tag.create([{nom: "Le constat", mere: nil},
  {nom: "L'analyse", mere: nil},
  {nom: "La décision", mere: nil},
  {nom: "L'action", mere: nil},
  {nom: "Cap vers la Cohérence", mere: nil}])

# Création de quelques "sous-catégories"
Tag.create([{nom: "Formation", mere: Tag.find_by(:nom => "Le constat").id},
  {nom: "Quizz", mere: Tag.find_by(:nom => "Le constat").id}])

