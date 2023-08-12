class AddDescriptionToTreasures < ActiveRecord::Migration[7.0]
  def change
    add_column :treasures, :description, :string
  end
end
