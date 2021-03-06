# == Schema Information
#
# Table name: task_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color_code :integer
#  project_id :integer
#  position   :integer
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color_hex  :string(255)
#

class TaskType < ActiveRecord::Base
  attr_accessible :color_code, :name, :position, :project_id, :type, :id,
  				  :created_at, :updated_at, :color_hex
  belongs_to :project
  has_many :tasks
end
