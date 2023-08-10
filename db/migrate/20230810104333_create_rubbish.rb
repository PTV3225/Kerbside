class CreateRubbish < ActiveRecord::Migration[7.0]
  def change
    create_table :rubbishes do |t|
      t.integer :rubbish_type_id
      t.boolean :status
      t.integer :post_id

      t.timestamps
    end
  end
end
