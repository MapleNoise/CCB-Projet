class AjoutDatePublication < ActiveRecord::Migration
  def change
    add_column :formations, :datePublication, :datetime
    add_column :formations, :prix, :float
  end
end
