# == Schema Information
#
# Table name: workspaces
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  type       :string(255)
#

class Workspace < ActiveRecord::Base
	attr_accessor :name, :type	
	
end
