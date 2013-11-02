# == Schema Information
#
# Table name: subtasks
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  task_id    :integer
#  creator_id :integer
#  completed  :boolean
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subtask < ActiveRecord::Base
  attr_accessible :body, :completed, :creator_id, :task_id, :type
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :task
end
