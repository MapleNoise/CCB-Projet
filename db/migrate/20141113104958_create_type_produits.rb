class CreateTypeProduits < ActiveRecord::Migration
  def change
    create_table :type_produits do |t|
      t.string :nom
      t.text :format

      t.timestamps
    end
  end
end
