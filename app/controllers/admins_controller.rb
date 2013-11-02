class AdminsController < UsersController

	require 'httparty'

	before_filter :admin_user,     only: [:panel, :init_workspace]

	def panel
	end


	def init_memberships
		if ProjectMembership.count == 0
			memberships = Kanbanery::get_memberships(current_user)
			if memberships 
				memberships.each do |m|
					membership = ProjectMembership.new
					membership.id = m["id"]
					membership.email = m["email"]
					membership.permission = m["permission"]
					membership.project_id = m["project_id"]
					membership.user_id = m["user_id"]
					membership.type = m["type"]
					membership.created_at = m["created_at"]
					membership.updated_at = m["updated_at"]
					membership.save
				end
				flash[:success] = "Sucess"
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
					task_type = TaskType.new
					task_type.id = t["id"]
					task_type.name = t["name"]
					task_type.color_code = t["color_code"]
					task_type.position = t["position"]
					task_type.type = t["type"]
					task_type.project_id = t["project_id"]
					task_type.created_at = t["created_at"]
					task_type.updated_at = t["updated_at"]
					task_type.save
				end
				flash[:success] = "Sucess"
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
					estimate = Estimate.new
					estimate.id = e["id"]
					estimate.label = e["label"]
					estimate.project_id = e["project_id"]
					estimate.type = e["type"]
					estimate.created_at = e["created_at"]
					estimate.updated_at = e["updated_at"]
					estimate.save
				end
				flash[:success] = "Sucess"
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
					column = Column.new
					column.id = c["id"]
					column.name = c["name"]
					column.project_id = c["project_id"]
					column.fixed = c["fixed"]
					column.capacity = c["capacity"]
					column.position = c["position"]
					column.type = c["type"]
					column.created_at = c["created_at"]
					column.updated_at = c["updated_at"]
					column.save
				end
				flash[:success] = "Sucess"
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
					task = Task.new
					task.id = t["id"]
					task.task_type_id = t["task_type_id"]
					task.column_id = t["column_id"]
					task.creator_id = t["creator_id"]
					task.description = t["description"]
					task.estimate_id = t["estimate_id"]
					task.owner_id = t["owner_id"]
					task.position = t["position"]
					task.priority = t["priority"]
					task.ready_to_pull = t["ready_to_pull"]
					task.blocked = t["blocked"]
					task.created_at = t["created_at"]
					task.updated_at = t["updated_at"]
					task.moved_at = t["moved_at"]

					task.type = t["type"]
					task.archived = false
					task.iceboxed = false
					task.save
				end	
				else
				success = false		
			end
			tasks = Kanbanery::get_archived_tasks(current_user)
			if tasks 
				tasks.each do |t|
					task = Task.new
					task.id = t["id"]
					task.task_type_id = t["task_type_id"]
					task.column_id = t["column_id"]
					task.creator_id = t["creator_id"]
					task.description = t["description"]
					task.estimate_id = t["estimate_id"]
					task.owner_id = t["owner_id"]
					task.position = t["position"]
					task.priority = t["priority"]
					task.ready_to_pull = t["ready_to_pull"]
					task.blocked = t["blocked"]
					task.created_at = t["created_at"]
					task.updated_at = t["updated_at"]
					task.moved_at = t["moved_at"]
					task.type = t["type"]
					task.archived = true
					task.iceboxed = false
					task.save
				end		
				else 
				success = false	
			end
			tasks = Kanbanery::get_icebox_tasks(current_user)
			if tasks 
				tasks.each do |t|
					task = Task.new
					task.id = t["id"]
					task.task_type_id = t["task_type_id"]
					task.column_id = t["column_id"]
					task.creator_id = t["creator_id"]
					task.description = t["description"]
					task.estimate_id = t["estimate_id"]
					task.owner_id = t["owner_id"]
					task.position = t["position"]
					task.priority = t["priority"]
					task.ready_to_pull = t["ready_to_pull"]
					task.blocked = t["blocked"]
					task.created_at = t["created_at"]
					task.updated_at = t["updated_at"]
					task.moved_at = t["moved_at"]
					task.type = t["type"]
					task.archived = false
					task.iceboxed = true
					task.save
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
