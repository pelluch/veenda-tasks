module Kanbanery

	require 'httparty'
	SITE = "https://kanbanery.com/api/v1"
	WORKSPACE = "iic215420132"
	PROJECT_ID = "39793"

	def self.get_workspace_projects(user)
		workspace_url = SITE + "/user/workspaces.json"
		response = HTTParty.get(workspace_url, {:headers => headers(user.api_token) })
		if response
			workspace_info = JSON.parse(response.body)
		else
			nil
		end
	end

	def self.headers(api_token)
		{ 'X-Kanbanery-ApiToken' => api_token }
	end

end