class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :utilisateur2s, :email, unique: true
  end
end
