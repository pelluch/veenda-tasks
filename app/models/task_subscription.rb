# == Schema Information
#
# Table name: task_subscriptions
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  user_id    :integer
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskSubscription < ActiveRecord::Base
  attr_accessible :task_id, :type, :user_id, :id, :created_at, :updated_at
  belongs_to :task
  belongs_to :user
end
