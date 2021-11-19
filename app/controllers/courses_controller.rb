class CoursesController < ApplicationController
  def index
  end
  def new
    @course = Course.new
  end
  def create
    # render html: params
    # redirect_to courses_path
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  private
  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end


# params:{"authenticity_token"=>"jiTJXNQltX-ZoOKShgWLLewEvuXMx_n1GpzR_lsceypOZ2eNf9u9ocqakM14lbCen68_psNAH0mhFYTit2p9YQ", 
# "course"=>{"name"=>"", "price"=>"", "intro"=>"", "hour"=>""}, 
# "commit"=>"送出", 
# "controller"=>"courses", 
# "action"=>"create"}
