#encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Création d'utilisateur

Utilisateur2.create(
  [{name: "Thomas Ayoub",
  email: "ayoub@gmail.com",
  password: "azerty12",
  password_confirmation: "azerty12"},
  {name: "Maxime Mangel",
  email: "mangel.maxime@outlook.com",
  password: "azerty12",
  password_confirmation: "azerty12"}
  ])

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

ExtensionFichier.create(extension: "youtube")

TypeProduit.create(
  nom: "Fichier Excel",
  :extension_fichiers => ExtensionFichier.where(:extension => [".xls", ".csv"]))

TypeProduit.create(
	nom: "Fichier Word",
	:extension_fichiers => ExtensionFichier.where(:extension => [".doc", ".docx", ".rtf", ".docm"]))

TypeProduit.create(
  nom: "Vidéo",
  :extension_fichiers => ExtensionFichier.where(:extension => ["youtube"]))

# Création des catégories de bases
Tag.create([{nom: "Le constat", mere: nil},
  {nom: "L'analyse", mere: nil},
  {nom: "La décision", mere: nil},
  {nom: "L'action", mere: nil},
  {nom: "Cap vers la Cohérence", mere: nil}])

# Création de quelques "sous-catégories"
Tag.create([{nom: "Formation", mere: Tag.find_by(:nom => "Le constat").id},
  {nom: "Quizz", mere: Tag.find_by(:nom => "Le constat").id},
  {nom: "Quizz", mere: Tag.find_by(:nom => "L'analyse").id}])

# Création de produits
produit1 = Produit.create(
  ref: "80ba14f781d79164",
  nom: "Produit 1",
  prix: 10.0,
  type_produits_id: 1,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: false,
  urlFichier: "http://localhost:3000/test.docx")
  
produit1.tags << Tag.find_by(:nom => "Le constat")
produit1.tags << Tag.find_by(:nom => "Formation", :mere => Tag.find_by(:nom => "Le constat"))


produit2 = Produit.create(
  ref: "90ba14f781d72264",
  nom: "Produit 2",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true,
  urlFichier: "http://localhost:3000/test.docx")
  
produit2.tags << Tag.find_by(:nom => "L'analyse")
produit2.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

produit3 = Produit.create(
  ref: "90ba14f781d12464",
  nom: "Produit 3",
  prix: 10.0,
  type_produits_id: 3,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true,
  urlFichier: "https://www.youtube.com/watch?v=DnGdoEa1tPg&index=27&list=RDHCqCy8JROFn5Y&spfreload=1")
  
produit3.tags << Tag.find_by(:nom => "L'analyse")
produit3.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

# Création des status
Status.create([{nom: "En ligne"},
  {nom: "En cours"},
  {nom: "Désactivé"}])

# Création des fonctions
Fonction.create([{nom: "Expert"},
  {nom: "Administrateur"},
  {nom: "Client"}])