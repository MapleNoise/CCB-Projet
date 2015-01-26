class CreateChapitres < ActiveRecord::Migration
  def change
    create_table :chapitres do |t|
      t.string :ref
      t.string :nom
      t.string :description
      t.string :texte
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
