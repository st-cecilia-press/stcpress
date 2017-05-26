module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    def new
      authorize! :manage, :all
      @user = User.new
    end
    def create
      @user = User.new(user_params)
      @user.password = Devise.friendly_token.first(8)
      @user.admin = false
      if @user.save
        redirect_to root_path
        @user.send_reset_password_instructions
      else
        render :new
      end 
    end
    private
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
