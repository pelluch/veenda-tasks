class TasksController < ApplicationController

  require 'will_paginate/array'
  before_filter :signed_in_user, only: [:index]

  def index
    @tasks = Task.all.paginate(page: params[:page])
    @title = "All tasks"
  end

  def summary
    @column = Column.find_by_name("In progress")
    @title = "Tasks in progress"
    if @column
      @tasks = @column.tasks.paginate(page: params[:page])
    else
      redirect_to home_path
    end
    render :index
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to home_path
    end
  end

end
