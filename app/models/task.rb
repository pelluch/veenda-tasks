# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  column_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :column_id

  belongs_to :user
end
