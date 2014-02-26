class UsersController < ApplicationController

	def index
        role = Role.where(name: "professional").first
		@professionals = User.where(role_id: role.id)
	end

end
