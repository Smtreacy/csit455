class AdminController < ApplicationController
  layout 'index'

  def index
    @teacher = Teacher.find_by_email(session[:email])
    # if teacher is an admin, give ability to
    # see and change ALL courses, books, etc..
    if @teacher.admin && session[:admin]
      @courses = Course.where(deptName: @teacher.department)
    else
      flash[:fail] = "You do not have admin privliges!"
      redirect_to '/index'
    end
  end

  def search
    query = "%" + params[:search] + "%"
    if (query == '%%')
      redirect_to"/admin/index"
    else
      @teacher = Teacher.find_by_email(session[:email])
      @course = Course.where("name LIKE ? AND deptName = '#{@teacher.department}'", query)

    end
    end


  def return
    redirect_to"/admin/index"
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

  def toggle
    session[:admin] = !session[:admin]
    if session[:admin]
      redirect_to "/admin/index"
    else
      redirect_to "/index"
    end
  end

  #This is what im testing for email submit
  def send_email
    redirect_to"/index/sendEmail"
  end

end
