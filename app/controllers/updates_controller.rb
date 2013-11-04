class UpdatesController < ApplicationController

	before_filter :authenticate_token

	# DELETE
	def destroy		
		puts params
		type = params["resource"]["type"]
		resource = Kanbanery::get_resource(type)		
		if resource
			concrete_record = resource.find(params["resource"]["id"])
			concrete_record.destroy
		end
		render :nothing => true, status: :ok, :content_type => 'text/html'
	end

	# POST
	def create		
		puts params
		type = params["resource"]["type"]
		resource = Kanbanery::get_resource(type)
		if resource
			resource.create(params["resource"])
		end
		render :nothing => true, status: :ok, :content_type => 'text/html'
	end

	# PUT
	def update		
		puts params
		type = params["resource"]["type"]
		resource = Kanbanery::get_resource(type)
		if resource
			concrete_record = resource.find(params["resource"]["id"])
			concrete_record.update_attributes(params["resource"])
		end
		render :nothing => true, status: :ok, :content_type => 'text/html'
	end

	def authenticate_token
		unless params["auth_token"] == Kanbanery::AUTH_TOKEN
			render :nothing => true, :status => :unauthorized, :content_type => 'text/html'
		end
	end

end
