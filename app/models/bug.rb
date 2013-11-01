# == Schema Information
#
# Table name: bugs
#
#  id          :integer          not null, primary key
#  task_id     :integer
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bug < ActiveRecord::Base
  attr_accessible :description, :task_id
end
