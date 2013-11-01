class UsersController < ApplicationController

	require 'httparty'
	# List all users
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		if @user
			info_url = Kanbanery::SITE + "/user.json"
			headers = { 'X-Kanbanery-ApiToken' => @user.api_token }
			response = HTTParty.get( info_url, { :headers => headers } )
			@user_info = JSON.parse(response.body)
		end
	end

	def create
	    @user = User.new(params[:user])
	    if @user.save
	      sign_in @user
	      flash[:success] = "Welcome to Veenda Tasks!"
	      redirect_to @user
	    else
	      render 'new'
	    end
    end

    def new
    	@user = User.new
  	end
end
