module Kanbanery

	require 'httparty'
	KANBAN_API_URL = "https://kanbanery.com/api/v1"
	WORKSPACE_NAME = "iic215420132"
	WORKSPACE_ID = 29577
	PROJECT_ID = 39793
	PROJECT_URL = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/projects/#{PROJECT_ID}"

	def self.get_memberships(user)
		get_url = "#{PROJECT_URL}/memberships.json"
		puts get_url
		puts headers(user.api_token)
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.headers(api_token)
		{ 'X-Kanbanery-ApiToken' => api_token }
	end

	def self.get_column_tasks
	end

	def self.get_archived_tasks
	end

	def self.get_icebox_tasks
	end

	def self.create_task
	end

	def self.get_task
	end

	def self.update_task 
	end

	def self.delete_task 
	end 

	



end