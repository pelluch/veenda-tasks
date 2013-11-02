# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#  url          :string(255)
#  type         :string(255)
#  workspace_id :integer
#

class Project < ActiveRecord::Base
  attr_accessible :url, :type, :name, :workspace_id
  has_many :tasks
  has_many :project_memberships
  has_many :task_types
  has_many :estimates
  has_many :columns
  belongs_to :workspace
end
