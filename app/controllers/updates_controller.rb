class UpdatesController < ApplicationController

	def index
	end

	def new
	end

	def show
	end

	def edit		
	end

	# DELETE
	def destroy		
		puts params
		type = params["resources"]["type"]
		resource = get_resource(type)
		if resource
			puts "The resource #{type} exists"
		else
			puts "The resource #{type} DOES NOT exist"
		end
		render json: { :status => "ok" }, status: :ok
	end

	# POST
	def create		
		puts params
		type = params["resources"]["type"]
		resource = get_resource(type)
		if resource
			puts "The resource #{type} exists"
		else
			puts "The resource #{type} DOES NOT exist"
		end
		render json: { :status => "ok" }, status: :ok
	end

	# PUT
	def update		
		puts params
		type = params["resources"]["type"]
		resource = get_resource(type)
		if resource
			puts "The resource #{type} exists"
		else
			puts "The resource #{type} DOES NOT exist"
		end
		render json: { :status => "ok" }, status: :ok	
	end

	private

	def get_resource(type)
		if Module.const_defined?(type)
			Object.const_get(type)
		else
			nil
		end
	end
end
