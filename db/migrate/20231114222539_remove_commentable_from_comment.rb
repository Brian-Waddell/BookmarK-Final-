class RemoveCommentableFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :commentable, :string
  end
end
