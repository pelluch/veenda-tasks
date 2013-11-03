class KanbanTestsController < ApplicationController
  
  def index
    @kanban_tests = current_user.tester_tests.paginate(page: params[:page])
  end

end
