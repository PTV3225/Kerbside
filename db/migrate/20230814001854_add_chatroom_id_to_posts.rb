class AddChatroomIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :chatroom, foreign_key: true
  end
end
