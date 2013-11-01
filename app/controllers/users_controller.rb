class UsersController < ApplicationController

    require 'httparty'

    before_filter :signed_in_user, only: [:edit, :update]
    before_filter :correct_user,   only: [:edit, :update]

    # List all users
    def index
        @users = User.all
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
    
    private


    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end