class AddForeignKeyAndChangeTitleToTreasureTypes < ActiveRecord::Migration[7.0]
  def change
    # Add foreign key
    add_reference :treasure_types, :video, foreign_key: true

    # Change title column in treasure_types
    rename_column :treasure_types, :treasure_type, :category



  end

end
