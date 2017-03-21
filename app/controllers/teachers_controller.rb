class TeachersController < ApplicationController
  protect_from_forgery except: [:create]
  # always render using the index layout
  layout  'index'
  attr_accessor :first
  attr_accessor :last

  def show
    @teacher = Teacher.find_by_email(session[:email])
    @courses = @teacher.courses.all
    # @courses_without_books = Teacher.find_by_sql("SELECT ")
  end

  def new
    @teacher = Teacher.new
  end

  # create a new teacher in the database
  # pointed at by form 'create' in signup.html.erb
  def create
    # take first and last name given in the form
    f_name = params[:fName].capitalize
    l_name = params[:lName].capitalize
    # concatenate them
    full_name = f_name + ' ' + l_name

    # if passwords match, create new teacher
    # else redirect back
    if params[:su_password] == params[:confirmPass]
      @teacher = Teacher.new({department: params[:department].upcase, name: full_name,
                              email: params[:email], password: params[:su_password],
                              password_confirmation: params[:confirmPass], admin: params[:admin] == 'true' ? true : false})
    else
      # ADD FLASH MESSAGE
      flash[:fail] = "The passwords entered do not match!"
      redirect_back(fallback_location: '/')
      return
    end

    # save new teacher object to rails database
    if @teacher.valid? && @teacher.save
      # redirect home with success message
      flash[:success] = "Account created successfuly!"
      redirect_back(fallback_location: '/')
    else
      # if not correct, redirect back to home with error
      if @teacher.invalid?
        flash[:fail] = "unable to create teacher object: #{@teacher.errors.full_messages}"
      else
        flash[:fail] = "Unable to create account. Please verify information and try again."
      end

      redirect_back(fallback_location: '/')
    end
  end

  def edit
    @teacher = Teacher.find_by_email(session[:email])
    names = @teacher.name.split
  end

  def update

  end

  def logout
    # log the user out and
    # reset all information stored in the session
    reset_session
    # redirect to dashboard#authenticate
    redirect_to '/'
  end

end
