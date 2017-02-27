class AdminController < ApplicationController
  layout 'index'

  def index
    @teacher = Teacher.find_by_email(session[:email])

    if @teacher.admin

    else
      flash[:fail] = "You do not have admin privliges!"
      redirect_to '/index'
      return
    end

    @courses = @teacher.courses.all
  end

  def add_course

  end

end
