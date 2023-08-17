class RemoveVideoIdFromTreasureTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :treasure_types, :video_id
  end
end
