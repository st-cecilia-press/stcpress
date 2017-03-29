class CreateEnsembles < ActiveRecord::Migration
  def change
    create_table :ensembles do |t|
      t.string :description
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
