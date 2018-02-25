class CoursesController < ApplicationController

	def new
  	@course = Course.new
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

   def create
    @course = Course.new(course_params)
    puts @course.valid?
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    if @course.update(course_params)
      render "index"
    else
      render 'edit'
    end
  end

  def destroy
  	@course.destroy
  	render "index"
  end

   private

    def course_params
      params.require(:course).permit(:name,:description,:user_id)
    end
end
