class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :nom
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
