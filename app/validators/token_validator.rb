class TokenValidator < ActiveModel::Validator

	require 'httparty'

	def validate(record)
		info_url = Kanbanery::SITE + "/user.json"
        headers = { 'X-Kanbanery-ApiToken' => record.api_token }
        response = HTTParty.get( info_url, { :headers => headers } )
        unless response.code == 200
        	record.errors[:api_token] << 'Invalid Api Token'
        end
	end
end

