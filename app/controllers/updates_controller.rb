class UpdatesController < ApplicationController

	def index
	end
	
	def show
	end

	# DELETE
	def destroy		
		puts params
		type = params["resource"]["type"]
		resource = Kanbanery::get_resource(type)		
		if resource
			concrete_record = resource.find(params["resource"]["id"])
			concrete_record.destroy
		end
		render json: { :status => "ok" }, status: :ok
	end

	# POST
	def create		
		puts params
		type = params["resource"]["type"]
		resource = Kanbanery::get_resource(type)
		if resource
			resource.create(params["resource"])
		end
		render json: { :status => "ok" }, status: :ok
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
		render json: { :status => "ok" }, status: :ok	
	end
end
