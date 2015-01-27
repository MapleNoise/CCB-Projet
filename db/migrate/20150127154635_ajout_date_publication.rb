class AjoutDatePublication < ActiveRecord::Migration
  def change
    add_column :formations, :datePublication, :datatime
    add_column :formations, :prix, :float
  end
end
