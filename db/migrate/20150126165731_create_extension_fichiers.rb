class CreateExtensionFichiers < ActiveRecord::Migration
  def change
    create_table :extension_fichiers do |t|
      t.string :extension

      t.timestamps
    end
         create_join_table :extension_fichiers, :type_produits

  end
end
