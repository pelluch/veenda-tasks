require 'kanbanery'
class Column < ActiveRecord::Base
	include Kanbanery
	attr_accessible :project_id
end
