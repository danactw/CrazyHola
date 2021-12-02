class Api::V1::CoursesController < ApplicationController
  before_action :check_login

  # skip_before_action :verify_authenticity_token
  # 為了避免被灌票或灌水，在rails裡只要用post方法，就會需要檢查token，確認你是合法的使用者，而非站外的人
  # 有些情境下拿不到token時，只能skip掉 => 要做一個公開的API，讓別人來取用的話就可以關掉 ex:randomuser
  def like 

    course = Course.find(params[:id])
    favorited_course = FavorCourse.find_by(user:current_user, course: course)
    if favorited_course
      favorited_course.destroy
      render json: { status: "like"}
    else
      current_user.favorite_courses << course
      render json: { status: "unlike"}
    end

    # early reutrn
    # if not user_signed_in?
    #   render json: { status: "fail", message: "login in please"}, status:401
    #   return
    # end
    # render json: { status: "ok", message: ""}

    # 會出錯http500，因為double render
    # if not user_signed_in?
    #   render json: { status: "fail", message: "login in please"}, status:401
    # end
    # render json: { status: "ok", message: ""}
  end
  
  private
  def check_login
    if not user_signed_in?
      render json: { status: "fail", message: "login in please"}, status:401
      return
    end
  end
end
