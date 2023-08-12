class DropRubbish < ActiveRecord::Migration[7.0]
  def change
    drop_table :rubbishes
  end



end
