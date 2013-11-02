# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#  author_id  :integer
#  type       :string(255)
#

class Comment < ActiveRecord::Base
  attr_accessible :task_id, :body, :author_id, :type
  belongs_to :author, :class_name => "User", :foreign_key => :author_id
  belongs_to :task
end
