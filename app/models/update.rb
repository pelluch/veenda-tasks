class Update < ActiveRecord::Base
  attr_accessible :resource_id, :resource_type, :update_type
  belongs_to :user
end