class ApplicationController < ActionController::Base
	
  include SessionsHelper
  
  
  after_filter :cors_set_access_control_headers

	# Force signout to prevent CSRF attacks
	def handle_unverified_request
		sign_out
		super
	end
	
	def cors_preflight_check
	  logger.info ">>> responding to CORS request"
	  render :text => '', :content_type => 'text/plain'
	end

	# For all responses in this controller, return the CORS access control headers. 
	def cors_set_access_control_headers
	  headers['Access-Control-Allow-Origin'] = '*'
	  headers['Access-Control-Request-Method'] = '*'
	  headers['Access-Control-Allow-Headers'] = 'X-AUTH-TOKEN, X-API-VERSION, X-Requested-With, Content-Type, Accept, Origin'
	  headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
	  headers['Access-Control-Max-Age'] = "1728000"
	end

	def admin_user
  		redirect_to(root_url) unless current_user.admin?
  	end

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
