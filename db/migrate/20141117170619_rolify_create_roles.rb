class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:utilisateurs_roles, :id => false) do |t|
      t.references :utilisateur
      t.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:utilisateurs_roles, [ :utilisateur_id, :role_id ])
  end
end
