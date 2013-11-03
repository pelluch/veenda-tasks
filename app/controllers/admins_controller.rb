class AdminsController < UsersController

	require 'httparty'

	before_filter :admin_user

	def panel
		render :panel
	end

	def tests
		@column = Column.find_by_name("Ready for Testing")
	    if @column
	      @tasks = @column.tasks.paginate(page: params[:page], :per_page => 10).order('position ASC')
	      render :tests
	    else
	      redirect_to home_path
	    end    
	end

	def init_memberships
		if ProjectMembership.count == 0
			memberships = Kanbanery::get_memberships(current_user)
			if memberships 
				memberships.each do |m|
					m = Kanbanery::remove_protected(m)
					ProjectMembership.create(m)
				end
				flash[:success] = "Sucessfully initialized memberships"
			redirect_to admins_panel_path
			else
				flash[:error] = "Error initializing memberships"
				redirect_to admins_panel_path
			end
		else
			flash[:error] = "Memberships have already been initialized"
			redirect_to admins_panel_path
		end
	end

	def init_task_types
		if TaskType.count == 0
			task_types = Kanbanery::get_task_types(current_user)
			if task_types 
				task_types.each do |t|
					t = Kanbanery::remove_protected(t)
					task = TaskType.new(t)
					if task.color_hex == ""
						if task.color_code == 0
							task.color_hex = "ff3333"
						elsif task.color_code == 1
							task.color_hex = "ff8533"
						elsif task.color_code == 2
							task.color_hex = "ffad33"
						elsif task.color_code == 3
							task.color_hex = "ffd633"
						elsif task.color_code == 4
							task.color_hex = "ffff33"
						elsif task.color_code == 5
							task.color_hex = "bceb2f"
						elsif task.color_code == 6
							task.color_hex = "2bd62b"
						elsif task.color_code == 7
							task.color_hex = "2babd6"
						elsif task.color_code == 8
							task.color_hex = "2b72d6"
						elsif task.color_code == 9
							task.color_hex = "472bd6"
						elsif task.color_code == 10
							task.color_hex = "9d2bd6"
						elsif task.color_code == 11
							task.color_hex = "e02d96"
						else
							task.color_hex = "ffffff"
						end							
					end
					task.save
				end
				flash[:success] = "Sucessfully initialized task types"
			redirect_to admins_panel_path
			else
				flash[:error] = "Error initializing task types"
				redirect_to admins_panel_path
			end
		else
			flash[:error] = "Task types have already been initialized"
			redirect_to admins_panel_path
		end
	end

	def init_estimates
		if Estimate.count == 0
			estimates = Kanbanery::get_estimates(current_user)
			if estimates 
				estimates.each do |e|
					e = Kanbanery::remove_protected(e)
					Estimate.create(e)
				end
				flash[:success] = "Sucessfully initialized estimates"
			redirect_to admins_panel_path
			else
				flash[:error] = "Error initializing estimates"
				redirect_to admins_panel_path
			end
		else
			flash[:error] = "Estimates have already been initialized"
			redirect_to admins_panel_path
		end
	end

	def init_columns
		if Column.count == 0
			columns = Kanbanery::get_columns(current_user)
			if columns 
				columns.each do |c|
					c = Kanbanery::remove_protected(c)
					Column.create(c)
				end
				flash[:success] = "Sucessfully initialized columns"
			redirect_to admins_panel_path
			else
				flash[:error] = "Error initializing columns"
				redirect_to admins_panel_path
			end
		else
			flash[:error] = "Columns have already been initialized"
			redirect_to admins_panel_path
		end
	end

	def init_tasks
		if Task.count == 0
			success = true
			tasks = Kanbanery::get_tasks(current_user)
			if tasks 
				tasks.each do |t|
					t = Kanbanery::remove_protected(t)
					task = Task.create(t)
				end	
			else
				success = false		
			end
			tasks = Kanbanery::get_archived_tasks(current_user)
			if tasks 
				tasks.each do |t|
					t = Kanbanery::remove_protected(t)
					task = Task.create(t)
				end		
			else 
				success = false	
			end
			tasks = Kanbanery::get_icebox_tasks(current_user)
			if tasks 
				tasks.each do |t|
					t = Kanbanery::remove_protected(t)
					task = Task.create(t)
				end		
			else 
				success = false	
			end
			if success
				flash[:success] = "Successfully initialized tasks"
				redirect_to admins_panel_path
			else
				flash[:error] = "Error initializing tasks"
				redirect_to admins_panel_path
			end
		else
			flash[:error] = "Tasks already initialized"
			redirect_to admins_panel_path
		end
	end
end
