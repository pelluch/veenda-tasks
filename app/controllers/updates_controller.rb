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
		render json: { :status => "ok" }, status: :ok
	end

	# POST
	def create		
		puts params
		render json: { :status => "ok" }, status: :ok
	end

	# PUT
	def update		
		puts params
		render json: { :status => "ok" }, status: :ok	
	end

end
