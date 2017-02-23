# Dashboard - The "launching point" for the app
# provides access point for other models/controllers
class DashboardController < ApplicationController
  # allow for custom login without ruby helpers
  protect_from_forgery except: [:login]

  # Controller to render the dashboard view
  def index
    # return all courses associated with the current user
    @teacher = Teacher.find_by_email(session[:email])

    # if teacher is an admin redirect to admin home
    # if @teacher.admin
    #   redirect_to '/adminindex'
    # end

    @courses = @teacher.courses.all
  end

  # different admin view
  def adminindex
    @teacher = Teacher.find_by_email(session[:email])
    if @teacher.admin

    else
      redirect_back(fallback_location: '/index')
    end
    @courses = @teacher.courses.all
  end

  # authentication view for the app
  def authenticate
    # if login failed, show error message
    if session[:login]
      # redirect_to '/index'
    else

    end
  end

  # login controller
  # if user is found, redirect to index
  # else redirect to authenticate with error
  def login
    # find a user in the database with the same email as entered
    @user = Teacher.find_by_email(params[:email])

    # if a user is found, and the password is correct, login
    if @user && @user.authenticate(params[:password])
      # add user information to session
      session[:login] = true
      session[:email] = @user.email
      redirect_to '/index'
    # else create an error and send back to authenticate view
    else
      session[:login] = false
      flash[:fail] = "Incorect username or password."
      redirect_to '/authenticate'
    end
  end

  # render signup partial in AJAX call
  def signup
    @teacher = Teacher.new
    render 'signup', :layout => false
  end


end
