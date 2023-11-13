# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :string           not null
#  commentable :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Comment < ApplicationRecord
end
