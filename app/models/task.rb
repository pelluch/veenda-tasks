class Task < ActiveRecord::Base
  attr_accessible :column_id

  belongs_to :user
end
