class CreateParamTvas < ActiveRecord::Migration
  def change
    create_table :param_tvas do |t|
      t.float :valeur
      t.string :label
      t.datetime :dateCreation
      t.datetime :dateSuppression

      t.timestamps
    end
  end
end
