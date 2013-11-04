class IssuesController < ApplicationController
	
	def index
		@issues = current_user.issues.paginate(page: params[:page])
	end

	def show
		@issue = Issue.find(params[:id])
	end

	def new
		@issue = Issue.new
		@issue.task_id = params[:task_id]
	end

	def create
		@issue = Issue.new(params[:issue])
	    @issue.created_at = Time.now
	    @issue.updated_at = Time.now
	    @issue.creator_id = current_user.id
	    @task = Task.find(params[:task_id])
	    @issue.task_id = @task.id

	    if @issue.save
	      flash[:success] = "Issue created"
	      redirect_to @issue
	    else
	      @users = User.all
	      render 'new'
	    end
	end
end
