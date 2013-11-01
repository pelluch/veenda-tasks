# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  workspace_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :workspace_id
  belongs_to :project
  has_many :tasks
end
