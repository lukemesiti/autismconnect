class UsersController < ApplicationController

	def index
		@users = User.all

	end

  def update
  	@user = User.find(params[:user][:user_id])
      if @user.update(user_params)
        redirect_to users_path, notice: "#{@user.name}'s details were successfully updated."
      else
        render action: 'index'
      end
  end



def user_params
      params.require(:user).permit(:name, :email, :role_id, :forem_admin)
end
  


end
