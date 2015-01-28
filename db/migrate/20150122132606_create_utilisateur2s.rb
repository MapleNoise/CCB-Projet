class CreateUtilisateur2s < ActiveRecord::Migration
  def change
    create_table :utilisateur2s do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
