module Kanbanery
	@@api_token
	@@site = "https://kanbanery.com/api/v1"

	def self.headers
		headers = super
		headers['X-Kanbanery-ApiToken'] = Kanbanery.api_token or raise "You must set Kanbanery.api_token to your API token"
		headers
	end
end