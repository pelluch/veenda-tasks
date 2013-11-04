# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  task_id     :integer
#  resolved    :boolean          default(FALSE)
#  type        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  creator_id  :integer
#

class Issue < ActiveRecord::Base
  attr_accessible :resolved, :task_id, :type, :url, :id, :created_at, :updated_at,
  				  :description
  belongs_to :task
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  
  def task_owner
  	task.owner
  end
end
