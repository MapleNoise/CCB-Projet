class RemoveUniqueOnEmailToUtilisateur < ActiveRecord::Migration
  def down
    add_index :utilisateurs, :email, unique: true
  end
  
  def up
    remove_index :utilisateurs, :email
  end
end
