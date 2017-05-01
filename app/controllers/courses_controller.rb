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
    # find if there are any courses with both the same name and section number
    duplicate_courses = Course.where(name: course_params[:name], section: course_params[:section])
    # SQL Equivalent (in SQLite):
    # SELECT "courses".* FROM "courses" WHERE "courses"."name" = ? AND "courses"."section" = ?
    # where ? == name of course and section of course

    if duplicate_courses.blank?
      # else make a new course based on parameters passed from form
      @course = Course.new(course_params)
      # check validity and successful save
      if @course.valid? && @course.save
        # @course.save SQL Equivalent:
        # INSERT INTO "courses"
        #   ("teacher_id", "deptName", "name", "section", "created_at", "updated_at")
        #   VALUES (?, ?, ?, ?, ?, ?);


        # redirect
        redirect_to '/admin/index'
        return
      else
        # otherwise check the error
        if @course.invalid?
          flash[:fail] = "Unable to create course: #{@course.errors.full_messages}"
        else
          flash[:fail] = "Unable to create course for unknown reason. Try again!"
        end

        redirect_back(fallback_location: '/admin/index')
        return
      end
    else
      # sent an error
      flash[:fail] = "There is already a course with that name and section!"
      redirect_back(fallback_location: '/admin/index')
    end
  end

  def submit
    course = Course.find(params[:id])
    if !course.submitted
      course.update(submitted: true)
    else
      course.update(submitted: false)
    end
  end

  private

  # helper function for validating parameters passed by course form
  def course_params
    params.require(:course).permit(:teacher_id, :course_number, :name, :deptName, :section, :submitted)
  end
end
