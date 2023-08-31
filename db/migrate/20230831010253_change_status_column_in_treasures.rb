class ChangeStatusColumnInTreasures < ActiveRecord::Migration[7.0]
  def change
    remove_column :treasures, :status
    add_column :treasures, :status, :integer, default: 0, null: false
    add_index :treasures, :status
  end
end
