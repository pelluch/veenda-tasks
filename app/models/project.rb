class Project < ActiveRecord::Base
  attr_accessible :workspace_id
  belongs_to :project
  has_many :tasks
end
