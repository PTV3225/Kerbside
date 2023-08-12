class CreateRubbishTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :rubbish_types do |t|
      t.string :rubbish_type
      t.integer :video_id

      t.timestamps
    end
  end
end
