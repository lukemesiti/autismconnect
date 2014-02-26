class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_user, only: [:index, :show, :edit, :update]
  

  def index
    role = Role.where(name: "professional").first
	@professionals = User.where(role_id: role.id)
  end

  def show
    @user = current_user
  end

  def edit
  end 

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'USer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
  
  def user_params
      params.require(:user).permit(:name, :street_address, :city, :state, :postcode, :number_of_children, :business_name, :practice_type, :website)
  end


end
