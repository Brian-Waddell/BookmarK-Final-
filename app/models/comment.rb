# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :string           not null
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  book_id          :integer
#  commentable_id   :integer          not null
#  user_id          :integer
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#
class Comment < ApplicationRecord
  belongs_to :participant, required: true, class_name: "User", foreign_key: "user_id"

  has_many :comments, as: :commentable

  belongs_to :commentable, polymorphic: true

  belongs_to :book, required: true, class_name: "Book", foreign_key: "book_id"
end
