class ChangeColumnDescriptionInEnsemble < ActiveRecord::Migration
  def change
    change_column :ensembles, :description, :text
  end
end
