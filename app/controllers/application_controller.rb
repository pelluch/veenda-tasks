class ApplicationController < ActionController::Base
	
  protect_from_forgery secret: "8493c8a995d4c90767c529e87b844b09e5a5e542"

  after_filter :cors_set_access_control_headers

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

end
