class ReviewsController < ApplicationController
  before_action :authenticate!

  def create
    #先找到那一門課，在
    course = Course.find(params[:course_id])
    @review = course.reviews.build(review_params)
    if @review.save
      # redirect_to course_path(course), notice: '完成評價'
    else
    end

  end

  private
  def review_params
    params.require(:review).permit(:rating, :title, :content).merge(user: current_user)
  end

end
