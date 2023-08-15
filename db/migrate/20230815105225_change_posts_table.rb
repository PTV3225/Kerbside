class ChangePostsTable < ActiveRecord::Migration[7.0]
  def change
    # Remove the user_id column from posts
    remove_column :posts, :user_id

    # Add a foreign key reference between posts and users
    add_reference :posts, :user, foreign_key: true
  end
end
