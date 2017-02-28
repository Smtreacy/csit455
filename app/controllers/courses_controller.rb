class CoursesController < ApplicationController
  # default to no layout (easier AJAX calls)
  layout false

  # form view for adding new courses
  def new
    @course = Course.new
    @teachers = Teacher.all
  end

  # save changes to database
  def create
    duplicate_courses = Course.where(name: params[:name], section: params[:section])

    if duplicate_courses.blank?

      @course = Course.new(course_params)
      if @course.valid? && @course.save
        redirect_to '/admin/index'
        return
      else
        if @course.invalid?
          flash[:fail] = "Unable to create course: #{@course.errors.full_messages}"
        else
          flash[:fail] = "Unable to create course for unknown reason. Try again!"
        end

        redirect_back(fallback_location: '/admin/index')
        return
      end
    else
      flash[:fail] = "There is already a course with that name and section!"
      redirect_back(fallback_location: '/admin/index')
    end
  end

  private

  def course_params
    params.require(:course).permit(:teacher_id, :name, :deptName, :section)
  end
end
