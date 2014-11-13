class CreateParamTvas < ActiveRecord::Migration
  def change
    create_table :param_tvas do |t|
      t.float :valeur
      t.varchar :label
      t.datetime :dateCreation
      t.varchar :dateSuppression

      t.timestamps
    end
  end
end
