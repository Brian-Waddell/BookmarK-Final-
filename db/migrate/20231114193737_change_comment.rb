class ChangeComment < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :commentable,  :reference 

  end
end
