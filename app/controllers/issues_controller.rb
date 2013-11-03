class IssuesController < ApplicationController
	def index
		@issues = current_user.issues.paginate(page: params[:page])
	end
end
