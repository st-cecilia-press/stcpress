class AddDanceSourceContentToDanceFacsimileImage < ActiveRecord::Migration
  def change
    add_reference :dance_facsimile_images, :dance_source_content, index: true, foreign_key: true
  end
end
