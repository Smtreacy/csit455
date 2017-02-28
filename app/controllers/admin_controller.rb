class AdminController < ApplicationController
  layout 'index'

  def index
    @teacher = Teacher.find_by_email(session[:email])

    if @teacher.admin
      @courses = Course.all
    else
      flash[:fail] = "You do not have admin privliges!"
      redirect_to '/index'
    end
  end

  def add_course
    # check to ensure teacher is an admin
    # prevent users from changing the id in the url
    # to get unexpected behaviour
    @teacher = Teacher.find_by_id(params[:teacher_id])

    if @teacher.admin?
      # get the correct partial
      render new_teacher_course_url(@teacher)
    else
      flash[:fail] = "Unable to render course form"
      redirect_back(fallback="/index")
    end
  end

end
