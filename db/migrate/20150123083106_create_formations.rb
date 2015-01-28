class CreateFormations < ActiveRecord::Migration
  def change
    create_table :formations do |t|
      t.string :ref
      t.string :nom
      t.string :descriptionCourte
      t.string :description
      t.boolean :estPublic
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
