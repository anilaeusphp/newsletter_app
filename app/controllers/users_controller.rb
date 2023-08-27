class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      sign_in(@user) # this provides from Passwordless gem
      redirect_to root_path, notice: "Account has been created successfully"
    else
      render :new, alert: "It seems a problem has been occured", status: :unprocessable_entity
    end
  end

  private
  def users_params
    params.require(:user).permit(:username, :email)
  end

end
