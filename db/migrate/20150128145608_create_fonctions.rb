class CreateFonctions < ActiveRecord::Migration
  def change
    create_table :fonctions do |t|
      t.string :nom

      t.timestamps
    end
    
    add_column :utilisateur2s, :fonctionId, :integer
  end
end
