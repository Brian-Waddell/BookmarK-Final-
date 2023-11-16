class RemoveCommentIdFromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :comment_id, :integer
  end
end
