class CreateTempleHistoryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_history_details do |t|
      t.text :temple_history
      t.text :temple_structure
      t.text :inside_temple_theertham
      t.text :outside_temple_theertham
      t.references :temple, foreign_key: true

      t.timestamps
    end
  end
end
