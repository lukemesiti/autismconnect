class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_user, only: [:show, :edit, :update]
  def show
    @user = current_user
  end

  def edit
  end 

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
  

end
