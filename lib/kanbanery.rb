module Kanbanery

	require 'httparty'
	KANBAN_API_URL = "https://kanbanery.com/api/v1"
	WORKSPACE_NAME = "iic215420132"
	WORKSPACE_ID = 29577
	PROJECT_ID = 39793
	PROJECT_URL = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/projects/#{PROJECT_ID}"
	ICEBOX_ID = 269877
	ARCHIVE_ID = 269878
	AUTH_TOKEN = "8493c8a995d4c90767c529e87b844b09e5a5e542"
	
	def self.get_memberships(user)
		get_url = "#{PROJECT_URL}/memberships.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_task_types(user)
		get_url = "#{PROJECT_URL}/task_types.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_estimates(user)
		get_url = "#{PROJECT_URL}/estimates.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_columns(user)
		get_url = "#{PROJECT_URL}/columns.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_tasks(user)
		get_url = "#{PROJECT_URL}/tasks.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_archived_tasks(user)
		get_url = "#{PROJECT_URL}/archive/tasks.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_icebox_tasks(user)
		get_url = "#{PROJECT_URL}/icebox/tasks.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_task_subscription(task_id, user)
		get_url = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/tasks/#{task_id}/subscription.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_task_comments(task_id, user)
		get_url = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/tasks/#{task_id}/comments.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_task_subtasks(task_id, user)
		get_url = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/tasks/#{task_id}/subtasks.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.get_task_issue(task_id, user)
		get_url = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/tasks/#{task_id}/issues.json"
		response = HTTParty.get(get_url, {:headers => headers(user.api_token)})
	end

	def self.create_task(user)
	end

	def self.get_task(user)
	end

	def self.move_task(task_id, column_id, user)
		put_url = "https://#{WORKSPACE_NAME}.kanbanery.com/api/v1/tasks/#{task_id}.json"
		headers = headers(user.api_token)
		headers['Content-Type'] = 'application/json'
		response = HTTParty.put(url, 
	    :body => { 
	    			:column_id => column_id,
	    			:id => task_id
	             }.to_json,
	    :headers => headers
	    )
	end

	def self.delete_task(user) 
	end 

	def self.remove_protected(response)
		resource = get_resource(response["type"])
		extra_keys = []
		if resource
			resources_attrs = resource.new.attributes.keys
			response.keys.each do |response_attr|
				if not resources_attrs.include?(response_attr)
					extra_keys << response_attr
				end
			end
		end
		extra_keys.each do |extra_key|
			response.delete(extra_key)
		end
		response
	end

	def self.get_resource(type)
		if Module.const_defined?(type)
			Object.const_get(type)
		else
			nil
		end
	end

	def self.headers(api_token)
		{ 'X-Kanbanery-ApiToken' => api_token }
	end



	



end