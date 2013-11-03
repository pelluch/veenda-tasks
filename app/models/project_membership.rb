# == Schema Information
#
# Table name: project_memberships
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  permission :string(255)
#  project_id :integer
#  user_id    :integer
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectMembership < ActiveRecord::Base
  attr_accessible :email, :permission, :project_id, :type, :user_id, :created_at, :updated_at,
  			      :id
  belongs_to :user
  belongs_to :project
end
