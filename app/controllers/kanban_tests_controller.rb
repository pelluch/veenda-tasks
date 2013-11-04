class KanbanTestsController < ApplicationController
  
  before_filter :admin_user,     only: [:new]

  def index
    @kanban_tests = current_user.tester_tests.paginate(page: params[:page])
  end

  def update
    @kanban_test = KanbanTest.find(params[:id])
    if @kanban_test.update_attributes(params[:kanban_test])
      @kanban_test.finished = true
      @kanban_test.save
      @column = Column.find_by_name("Done")
      Kanbanery::move_task(@kanban_test.task.id, @column.id, current_user)
      flash[:success] = "Test finished"      
      redirect_to kanban_tests_path
    else
      render 'edit'
    end    
  end

  def edit
    @kanban_test = KanbanTest.find(params[:id])
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
      @users = User.all
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
end
