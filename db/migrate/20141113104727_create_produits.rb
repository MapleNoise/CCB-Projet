class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :ref
      t.string :nom
      t.float :prix
      t.datetime :dateCreation
      t.datetime :dateModification
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
