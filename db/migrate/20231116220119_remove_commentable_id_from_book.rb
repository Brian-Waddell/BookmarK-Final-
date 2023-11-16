class RemoveCommentableIdFromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :commentable_id, :integer
    remove_column :books, :comment_id, :integer
  end
end
