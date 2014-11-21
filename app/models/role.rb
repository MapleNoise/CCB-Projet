class Role < ActiveRecord::Base
  has_and_belongs_to_many :utilisateurs, :join_table => :utilisateurs_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
