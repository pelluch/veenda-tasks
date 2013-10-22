class Test < ActiveRecord::Base
  attr_accessible :developer_id, :tester_id
  belongs_to :tester, :class_name => "User", :foreign_key => :tester_id
  belongs_to :developer, :class_name => "User", :foreign_key => :developer_id
end
