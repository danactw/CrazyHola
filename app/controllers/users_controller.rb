class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def account_verify
    @user = User.new(user_params)

    if @user.save
      redirect_to "/"
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end

  def check
    u = User.login(params[:user])
    if u
      session[:whatever123] = u.id
      redirect_to "/"
    else
      render html: "no user"
    end
  end

  def sign_out
    session[:whatever123] = nil
    redirect_to courses_path, notice: '已登出'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
