# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string           not null
#  genre        :string
#  photo        :string
#  publish_date :integer
#  summary      :string
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
class Book < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  has_many  :users_books, class_name: "Follow", foreign_key: "book_id", dependent: :destroy

  has_many :comments, as: :commentable
end
