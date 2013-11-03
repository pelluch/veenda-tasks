# == Schema Information
#
# Table name: subtasks
#
#  id         :integer          not null, primary key
#  body       :text
#  task_id    :integer
#  creator_id :integer
#  completed  :boolean
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subtask < ActiveRecord::Base
  attr_accessible :body, :completed, :creator_id, :task_id, :type,
  				  :created_at, :updated_at, :id

  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :task
end
