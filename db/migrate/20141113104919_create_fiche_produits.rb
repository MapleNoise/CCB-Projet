class CreateFicheProduits < ActiveRecord::Migration
  def change
    create_table :fiche_produits do |t|
      t.string :ref
      t.string :titre
      t.text :description
      t.text :descriptionCourte
      t.datetime :datePublication
      t.datetime :dateCreation
      t.datetime :dateModification
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
