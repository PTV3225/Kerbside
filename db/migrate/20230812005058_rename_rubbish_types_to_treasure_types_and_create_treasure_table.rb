class RenameRubbishTypesToTreasureTypesAndCreateTreasureTable < ActiveRecord::Migration[7.0]
  def change
    # Drop the old table
    drop_table :rubbish_types

    # Create the new table
    create_table :treasure_types do |t|
      t.string :treasure_type
      t.integer :video_id

      t.timestamps
    end

      create_table :treasures do |t|
        t.references :treasure_type, null: false, foreign_key: true
        t.boolean :status
        t.references :post, null: false, foreign_key: true

        t.timestamps
    end
  end
end
