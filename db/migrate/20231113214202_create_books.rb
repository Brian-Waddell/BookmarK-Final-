class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false 
      t.string :author, null: false 
      t.string :summary
      t.string :genre
      t.integer :publish_date
      t.integer :user_id, null: false 
      t.string :photo

      t.timestamps
    end
  end
end
