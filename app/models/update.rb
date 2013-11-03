# == Schema Information
#
# Table name: updates
#
#  id            :integer          not null, primary key
#  resource_type :integer
#  update_type   :integer
#  resource_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Update < ActiveRecord::Base
  attr_accessible :resource_id, :resource_type, :update_type
  belongs_to :user
end
