class ChangeCommentableInComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :commentable_type, :string, null: false
  end
end
