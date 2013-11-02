class AdminsController < UsersController

	require 'httparty'

	before_filter :admin_user,     only: [:panel, :init_workspace]

	def panel
	end

	def init_workspace
		if Workspace.count == 0
			info = Kanbanery::get_workspace_projects(current_user)
			workspace_attrs = { }
			if info 
				workspace_attrs[:name] = info[0]["name"]
				workspace_attrs[:type] = info[0]["type"]
				w = Workspace.new(workspace_attrs)
				w.id = info[0]["id"].to_i
				w.save
				info[0]["projects"].each do |project|
					project_attrs = {}
					project_attrs[:workspace_id] = w.id
					project_attrs[:type] = project["type"]
					project_attrs[:name] = project["name"]
					project_attrs[:url] = "https://" + w.name + ".Kanbanery.com/projects/" + project["id"].to_s
					p = Project.new(project_attrs)
					p.id = project["id"].to_i
					p.save
				end
				flash.now[:success] = "Success in creating workspace " + w.id.to_s
				render 'panel'
			else
				flash.now[:error] = "Error getting workspace information"
				render 'panel'
			end
		else
			flash.now[:error] = "Workspace already exists!"
			render 'panel'
		end
	end
end
