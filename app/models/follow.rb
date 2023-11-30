# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  user_id    :integer
#
class Follow < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id" 

  
end
