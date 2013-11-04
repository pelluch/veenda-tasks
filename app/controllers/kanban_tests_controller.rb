class KanbanTestsController < ApplicationController
  
  before_filter :admin_user,     only: [:new]

  def index
    @kanban_tests = current_user.tester_tests.paginate(page: params[:page])
  end

  def create
    @kanban_test = KanbanTest.new(params[:kanban_test])
    @kanban_test.created_at = Time.now
    @kanban_test.updated_at = Time.now
    @task = Task.find(params[:task_id])
    @kanban_test.developer_id = @task.creator.id
    @kanban_test.task_id = @task.id
    if @kanban_test.save
      flash[:success] = "Test created"
      redirect_to @kanban_test
    else
      render 'new'
    end
  end

  def new
  	@kanban_test = KanbanTest.new
  	@kanban_test.task_id = params[:task_id]
  	@users = User.all
  end

  def show
    @kanban_test = KanbanTest.find(params[:id])
  end

  private 

  def admin_user
  	redirect_to(root_url) unless current_user.admin?
  end

end
