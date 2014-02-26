class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_user, only: [:index, :show, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
  end 

  def update

  	#look for an extra parameter coming from the admin page - if you find it, run this save method
  	if params[:user][:source_page] == 'userAdmin'
  	  	@user = User.find(params[:user][:user_id])
  	  	params[:user].delete :source_page
      if @user.update(user_params)
        redirect_to users_path, notice: "Permissions for #{@user.name} were successfully updated."
      else
        render action: 'index'
      end

  	else

  		#this is the normal save method for saving a profile...
  		respond_to do |format|
	  		if @user.update(user_params)
	        	format.html { redirect_to profile_path, notice: 'User was successfully updated.' }
	        	format.json { head :no_content }
	        else
	        format.html { render action: 'edit' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	    	end
    	end

	end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
  
  def user_params
      params.require(:user).permit(:name, :street_address, :city, :state, :postcode, :number_of_children, :business_name, :practice_type, :website, :email, :role_id, :forem_admin, :source_page)
  end


end
