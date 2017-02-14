class TeachersController < ApplicationController
  protect_from_forgery except: [:create]

  def show
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(params[:create])
  end
end
