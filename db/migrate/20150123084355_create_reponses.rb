class CreateReponses < ActiveRecord::Migration
  def change
    create_table :reponses do |t|
      t.string :reponse
      t.boolean :estJuste
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
