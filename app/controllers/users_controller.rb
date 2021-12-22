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
    # STEP 1
    # email = params[:users][:email]
    # password = params[:users][:password]

    # salted_password = "xy#{password.reverse}hellohey"
    # encryted_password = Digest::SHA1.hexdigest(salted_password)

    # u = User.find_by(email: email, password: encryted_password)
    
    # STEP 2 => 把step 1的東西全部放進model的一個方法裡self.login(user_info), user_info=paramss[:user]

    # STEP 3 => keyword argument (請詳user.rb)
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
