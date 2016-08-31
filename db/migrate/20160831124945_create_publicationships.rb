class CreatePublicationships < ActiveRecord::Migration
  def change
    create_table :publicationships do |t|
      t.references :piece, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
