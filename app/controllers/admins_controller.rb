class AdminsController < UsersController

	require 'httparty'

	before_filter :admin_user,     only: [:panel, :init_workspace]

	def panel
	end

	def init_project
		if ProjectMembership.count == 0
			if not init_memberships
				flash.now[:error] = "Error initializing memberships"
				render 'panel'
			end
			flash.now[:success] = "Sucess"
			render 'panel'
		else
			flash.now[:error] = "Project has already been initialized"
			render 'panel'
		end
	end

	def init_memberships
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
				membership.save
			end
			true
		else
			false
		end
	end
end
