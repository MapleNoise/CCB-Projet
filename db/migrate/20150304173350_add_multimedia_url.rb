class AddMultimediaUrl < ActiveRecord::Migration
  def change
    add_column :produits, :urlMultimedia, :string
  end
end
