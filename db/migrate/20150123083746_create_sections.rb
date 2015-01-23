class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :ref
      t.string :nom
      t.string :description
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
