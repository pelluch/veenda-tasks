# == Schema Information
#
# Table name: subtasks
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subtask < ActiveRecord::Base
  attr_accessible :task_id
end
