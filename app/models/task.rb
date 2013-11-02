# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  column_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string(255)
#  task_type_id  :integer
#  creator_id    :integer
#  description   :text
#  estimate_id   :integer
#  owner_id      :integer
#  position      :integer
#  priority      :integer
#  ready_to_pull :boolean
#  blocked       :boolean
#  moved_at      :datetime
#  type          :string(255)
#  archived      :boolean
#  iceboxed      :boolean
#

class Task < ActiveRecord::Base
  attr_accessible :column_id, :title, :task_type_id, :creator_id, :description, :estimate_id, :owner_id, :position,
  				  :priority, :ready_to_pull, :blocked, :type
  belongs_to :column
  belongs_to :task_type
  belongs_to :estimate

  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id

  has_many :task_subscriptions
  has_many :subtasks
  has_many :comments
  has_many :issues

end
