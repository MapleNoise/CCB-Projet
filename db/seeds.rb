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

form1 = Formation.create(
    ref: "90ba14f781d7h464",
    nom: "L'anticipation",
    descriptionCourte:"Lorem ipsum dolor sit amet", 
    description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: false,
    prix: 10.0
  )

  form1.tags << Tag.find_by(:nom => "Le constat")
form1.tags << Tag.find_by(:nom => "Formation", :mere => Tag.find_by(:nom => "Le constat"))

form2 = Formation.create(
    ref: "90ba56f781d79464",
    nom: "La réflexion",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form2.tags << Tag.find_by(:nom => "L'analyse")
form2.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form3 = Formation.create(
    ref: "form36f781d79464",
    nom: "Le temps nécessaire",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form3.tags << Tag.find_by(:nom => "L'analyse")
form3.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form5 = Formation.create(
    ref: "form56f781d79464",
    nom: "La validation",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form5.tags << Tag.find_by(:nom => "L'analyse")
form5.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form6 = Formation.create(
    ref: "form66f781d79464",
    nom: "Le passage à l'action",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form6.tags << Tag.find_by(:nom => "L'analyse")
form6.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form7 = Formation.create(
    ref: "form7f781d79464",
    nom: "Eviter le burnout",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form7.tags << Tag.find_by(:nom => "L'analyse")
form7.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form8 = Formation.create(
    ref: "90ba56f781d79464",
    nom: "Remonter après un burnout",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form8.tags << Tag.find_by(:nom => "L'analyse")
form8.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form9 = Formation.create(
    ref: "90baform91d79464",
    nom: "Négocier une prime de départ",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form9.tags << Tag.find_by(:nom => "L'analyse")
form9.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form10 = Formation.create(
    ref: "form10f781d79464",
    nom: "Partir un jour",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form10.tags << Tag.find_by(:nom => "L'analyse")
form10.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form11 = Formation.create(
    ref: "form11f781d79464",
    nom: "Quand partir ?",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form11.tags << Tag.find_by(:nom => "L'analyse")
form11.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form12 = Formation.create(
    ref: "form12f781d79464",
    nom: "Comment fonder son entreprise",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form12.tags << Tag.find_by(:nom => "L'analyse")
form12.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

form13 = Formation.create(
    ref: "form13f781d79464",
    nom: "Comment bien préparer son plan comptable",
    descriptionCourte:"2Lorem ipsum dolor sit amet", 
    description:"2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.",
    estPublic: true,
    prix: 109.0
  )

form13.tags << Tag.find_by(:nom => "L'analyse")
form13.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))

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