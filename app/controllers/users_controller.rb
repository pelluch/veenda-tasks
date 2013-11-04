class UsersController < ApplicationController

    require 'httparty'

    before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
    before_filter :correct_user,   only: [:edit, :update]
    before_filter :admin_user,     only: [:destroy]

    # List all users
    def index
        @users = User.paginate(page: params[:page])
    end


  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

    def edit
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end

    def show
        @user = User.find(params[:id])
        if @user
            info_url = Kanbanery::KANBAN_API_URL + "/user.json"
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