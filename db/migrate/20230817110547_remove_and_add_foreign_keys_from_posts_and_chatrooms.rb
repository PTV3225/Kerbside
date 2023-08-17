class RemoveAndAddForeignKeysFromPostsAndChatrooms < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :chatroom, foreign_key: true

    add_reference :chatrooms, :post, foreign_key: true

  end
end
