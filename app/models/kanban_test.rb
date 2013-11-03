# == Schema Information
#
# Table name: kanban_tests
#
#  id           :integer          not null, primary key
#  tester_id    :integer
#  developer_id :integer
#  description  :string(255)
#  result       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  task_id      :integer
#  finished     :boolean
#

class KanbanTest < ActiveRecord::Base
  attr_accessible :id, :tester_id, :developer_id, :description, :result, 
  				  :created_at, :updated_at, :task_id, :finished
  
  belongs_to :tester, :class_name => "User", :foreign_key => :tester_id
  belongs_to :developer, :class_name => "User", :foreign_key => :developer_id
  belongs_to :task

end
