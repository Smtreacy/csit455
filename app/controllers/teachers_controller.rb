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
    if params[:su_password] == params[:confirmPass]
      @teacher = Teacher.new({department: params[:department], name: full_name,
                              email: params[:email], password: params[:su_password],
                              password_confirmation: params[:confirmPass], admin: params[:admin] ? true : false})
    else
      # ADD FLASH MESSAGE
      flash[:fail] = "The passwords entered do not match! #{params[:su_password]} and #{params[:confirmPass]}"
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
end
