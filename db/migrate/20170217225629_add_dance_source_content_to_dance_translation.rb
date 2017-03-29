class AddDanceSourceContentToDanceTranslation < ActiveRecord::Migration
  def change
    add_reference :dance_translations, :dance_source_content, index: true, foreign_key: true
  end
end
