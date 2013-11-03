# == Schema Information
#
# Table name: task_events
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  message    :text
#  name       :string(255)
#  user_id    :integer
#  project_id :integer
#  column_id  :integer
#  title      :text
#  created_at :datetime         not null
#

class TaskEvent < ActiveRecord::Base
  attr_accessible :column_id, :message, :name, :project_id, :task_id, :title, :user_id,
  				  :id, :created_at

  belongs_to :column
  belongs_to :project
  belongs_to :user
  belongs_to :task
  
end
