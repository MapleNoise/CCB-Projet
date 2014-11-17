class RemoveColumnFormatToTypeProduit < ActiveRecord::Migration
  def up
    remove_column :type_produits, :format
  end
  
  def down
    add_column :type_produits, :format, :text
  end
end
