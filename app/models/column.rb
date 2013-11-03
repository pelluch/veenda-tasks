# == Schema Information
#
# Table name: columns
#
#  id         :integer          not null, primary key
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  fixed      :boolean
#  capacity   :integer
#  position   :integer
#  type       :string(255)
#


class Column < ActiveRecord::Base
	attr_accessible :project_id, :type, :position, :capacity, :fixed, :name, :id,
				    :created_at, :updated_at
	belongs_to :project
	has_many :tasks
	has_many :task_events


end
