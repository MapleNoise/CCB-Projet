class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :nom

      t.timestamps
    end
    
     add_column :formations, :statusId, :integer
     add_column :produits, :statusId, :integer
  end
end
