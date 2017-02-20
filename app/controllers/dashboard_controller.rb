# Dashboard - The "launching point" for the app
# provides access point for other models/controllers
class DashboardController < ApplicationController
  # allow for custom login without ruby helpers
  protect_from_forgery except: [:login]

  # Controller to render the dashboard view
  def index
    # return all courses associated with the current user
    @user = Teacher.find_by_email(session[:email])
    @courses = @user.courses.all
  end

  # authentication view for the app
  def authenticate
    # if login failed, show error message
    if session[:login]
      # redirect_to '/index'
    else
      @login = false
    end
  end

  # login controller
  # if user is found, redirect to index
  # else redirect to authenticate with error
  def login
    # find a user in the database with the same email as entered
    @user = Teacher.find_by_email(params[:email])

    # if a user is found, and the password is correct, login
    if @user && @user.password == params[:password]
      # add user information to session
      session[:login] = true
      session[:email] = @user.email
      redirect_to '/index'
    # else create an error and send back to authenticate view
    else
      session[:login] = false
      redirect_to '/authenticate'
    end
  end

  # render signup partial in AJAX call
  def signup
    @teacher = Teacher.new
    render 'signup', :layout => false
  end


end