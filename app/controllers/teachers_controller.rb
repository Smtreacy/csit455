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

    # yes, I know this is super insecure
    pass1 = params[:password]

    # if passwords match, create new teacher
    # else redirect back
    if pass1 == params[:confirmPass]
      @teacher = Teacher.new({department: params[:department], name: full_name,
                              email: params[:email], password: pass1, admin: params[:admin] ? 0 : 1})
    else
      # if not correct, redirect back to home
      ### how do we send an error back with it?
      redirect_back(fallback_location: '/')
    end

    # save new teacher object to rails database
    @teacher.save
    # redirect home
    ### how can we tell if this was successful?
    redirect_back(fallback_location: '/')
  end
end
