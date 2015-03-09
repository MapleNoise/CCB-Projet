	class CreateQuizzs < ActiveRecord::Migration
  def change
    create_table :quizzs do |t|
      t.string :ref
      t.string :nom
      t.string :description
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
