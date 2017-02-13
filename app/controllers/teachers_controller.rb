class TeachersController < ApplicationController
  def show
    @teachers = Teacher.all
  end

  def create
    teacher = Teacher.new(params)
  end
end
