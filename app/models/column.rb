# == Schema Information
#
# Table name: columns
#
#  id         :integer          not null, primary key
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Column < ActiveRecord::Base
	attr_accessible :project_id
end
