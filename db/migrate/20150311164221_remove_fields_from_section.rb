class RemoveFieldsFromSection < ActiveRecord::Migration
  def up
  	change_table :sections do |t|
  		t.remove :ref
  		t.rename :nom, :titre
  	end
  end

  def down
  	change_table :sections do |t|
  		t.column :ref, :string
  		t.rename :titre, :nom
	end
  end
end
