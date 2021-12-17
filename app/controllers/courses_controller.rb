class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]
  before_action :authenticate!, except: [:index, :show]

  def index
    # @courses = Course.all      不知道要寫什麼的時候就寫all
    # @courses = Course.all.includes(:user)  若後面還有其他方法，就可以不要寫all
    @courses = Course.includes(:user)
  end

  def show
    @course = Course.find(params[:id])
    @review = Review.new
    # @reviews = Review.where(course_id: @course.id)  #用欄位
    # @reviews = Review.where(course: @course)  #用getter, setter的方是
    @reviews = @course.reviews.order(id: :desc)  #reviews是getter
    # lazy loading => 若在view裡面還沒有要用前，不會到資料庫裡面查資料，所以在log中只會有select
  end

  def buy
    @course = Course.find(params[:id])
    @order = Order.new

    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => 'v2226jhc6xqf4jss',
      :public_key => '6k96p6cxwpdbg67y',
      :private_key => '24f7c9159027fa7ef57c3290ec22fde2',
    )

    @token = gateway.client_token.generate()
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "新增課程成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "課程更新成功"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "課程已刪除"
  end

  private
  def set_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end
