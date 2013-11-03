class TasksController < ApplicationController
 
  before_filter :signed_in_user, only: [:index]

  def index
    @column = Column.find_by_name("In progress")
    if @column
      @tasks = @column.tasks.paginate(page: params[:page])
    else
      redirect_to home_path
    end
  end


  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to home_path
    end
  end

end
