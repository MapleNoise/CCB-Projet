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
  [{nom: "Ayoub",
  prenom: "Thomas",
  email: "ayoub@gmail.com",
  password: "azerty12",
  password_confirmation: "azerty12"},
  {nom: "Mangel",
  prenom: "Maxime",
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

ExtensionFichier.create(extension: ".jpg")


TypeProduit.create(
  nom: "Fichier Excel",
  :extension_fichiers => ExtensionFichier.where(:extension => [".xls", ".csv"]))

TypeProduit.create(
	nom: "Fichier Word",
	:extension_fichiers => ExtensionFichier.where(:extension => [".doc", ".docx", ".rtf", ".docm"]))

TypeProduit.create(
  nom: "Images",
  :extension_fichiers => ExtensionFichier.where(:extension => [".jpg"]))

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
  {nom: "Quizz", mere: Tag.find_by(:nom => "L'analyse").id},
  {nom: "Ebook", mere: Tag.find_by(:nom => "La décision").id}
  ])

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

urlSender = FichierGeneralUploader.new
urlSender.cache!(File.open(Dir.pwd + "/Lorem_ipsum_dolor_sit_amet.docx"))

# Création de produits
produit1 = Produit.new(
  ref: "80ba14f781d79164",
  nom: "Produit 1",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: false)
  
produit1.urlFichier = urlSender
produit1.tags << Tag.find_by(:nom => "Le constat")
produit1.tags << Tag.find_by(:nom => "Formation", :mere => Tag.find_by(:nom => "Le constat"))
produit1.save


produit2 = Produit.new(
  ref: "90ba14f781d12264",
  nom: "Produit 2",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit2.urlFichier = urlSender

produit2.tags << Tag.find_by(:nom => "L'analyse")
produit2.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))
produit2.save

produit3 = Produit.new(
  ref: "90ba14f231d12464",
  nom: "Produit 3",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit3.urlFichier = urlSender

produit3.tags << Tag.find_by(:nom => "La décision")
produit3.tags << Tag.find_by(:nom => "Ebook", :mere => Tag.find_by(:nom => "La décision"))
produit3.save

produit4 = Produit.new(
  ref: "90ba14f7jkze2464",
  nom: "Produit 4",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit4.urlFichier = urlSender

produit4.tags << Tag.find_by(:nom => "L'action")
produit4.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))
produit4.save

produit5 = Produit.new(
  ref: "90baa4ze81d12464",
  nom: "Produit 5",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit5.urlFichier = urlSender

produit5.tags << Tag.find_by(:nom => "Cap vers la Cohérence")
produit5.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))
produit5.save

produit6 = Produit.new(
  ref: "90bas23d81d12464",
  nom: "Produit 6",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit5.urlFichier = urlSender

produit5.tags << Tag.find_by(:nom => "L'analyse")
produit5.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))
produit5.save

produit6 = Produit.new(
  ref: "90ba1ddfg1ty2464",
  nom: "Produit 6",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit6.urlFichier = urlSender

produit6.tags << Tag.find_by(:nom => "L'analyse")
produit6.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))
produit6.save

produit6 = Produit.new(
  ref: "90ba1ddfg1d9a464",
  nom: "Produit 7",
  prix: 10.0,
  type_produits_id: 2,
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur.",
  descriptionCourte: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.",
  estPublic: true)
  
produit6.urlFichier = urlSender

produit6.tags << Tag.find_by(:nom => "L'analyse")
produit6.tags << Tag.find_by(:nom => "Quizz", :mere => Tag.find_by(:nom => "L'analyse"))
produit6.save

# Création des status
Status.create([{nom: "En ligne"},
  {nom: "En cours"},
  {nom: "Désactivé"}])

# Création des fonctions
Fonction.create([{nom: "Expert"},
  {nom: "Administrateur"},
  {nom: "Client"}])