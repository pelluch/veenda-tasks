# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  task_id    :integer
#  resolved   :boolean
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Issue < ActiveRecord::Base
  attr_accessible :resolved, :task_id, :type, :url, :id, :created_at, :updated_at
  belongs_to :task
end
