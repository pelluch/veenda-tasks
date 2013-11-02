# == Schema Information
#
# Table name: estimates
#
#  id         :integer          not null, primary key
#  value      :decimal(, )
#  label      :string(255)
#  project_id :integer
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Estimate < ActiveRecord::Base
  attr_accessible :label, :project_id, :type, :value
  belongs_to :project
end
