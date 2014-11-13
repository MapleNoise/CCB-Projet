class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nom
      t.integer :mere
      t.datetime :dateCreation
      t.datetime :dateModification
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
