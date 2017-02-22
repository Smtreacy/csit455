class TeachersController < ApplicationController
  protect_from_forgery except: [:create]

  def show
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  # create a new teacher in the database
  # pointed at by form 'create' in signup.html.erb
  def create
    # take first and last name given in the form
    f_name = params[:fName]
    l_name = params[:lName]
    # concatenate them
    full_name = f_name + ' ' + l_name

    # if passwords match, create new teacher
    # else redirect back
    if params[:password] == params[:confirmPass]
      @teacher = Teacher.new({department: params[:department], name: full_name,
                              email: params[:email], password: params[:password],
                              password_confirmation: params[:confirmPass], admin: params[:admin] ? 0 : 1})
    else
      redirect_back(fallback_location: '/')
    end

    # save new teacher object to rails database
    if @teacher.save
      # redirect home
      ### how can we tell if this was successful?
      redirect_back(fallback_location: '/')
    else
      # if not correct, redirect back to home
      ### how do we send an error back with it?
      redirect_back(fallback_location: '/')
    end
  end
end
