class AddCouncilPickupDateToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :council_pickup_date, :date
  end
end
