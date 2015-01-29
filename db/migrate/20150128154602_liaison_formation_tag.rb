class LiaisonFormationTag < ActiveRecord::Migration
  def change
  	create_join_table :formations, :tags
  end
end
