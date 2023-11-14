# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :string           not null
#  commentable :reference
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Comment < ApplicationRecord
  belongs_to :participant, required: true, class_name: "User", foreign_key: "user_id"

  #belongs_to :commentable, polymorphic: true, class_name: "comment", foreign_key: "user_id"
end
