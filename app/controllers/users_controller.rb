class UsersController  < ApplicationController
  def sign_up
    @user = User.new
  end
  def account_verify
    # 方法一
    clean_params = params.require(:user).permit(:username, :password, :email)
    @user = User.new(clean_params)
    if @user.save
      redirect_to "/"
    else
      render :sign_up   #我要借sign_up的view來用
    end

    #方法二
  end

  def sign_in
    @user = User.new
  end

  def check
    u = User.login(params[:user])
    if u 
      session[:number] = u.id 
      redirect_to "/"
    else
      render html: "no user"
    end
  end

end