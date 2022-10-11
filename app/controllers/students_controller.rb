class StudentsController < ApplicationController

  def index
    if params[:name]
      # @first_name = params[:name]
      # @last_name = params[:name]
      students = Student.where('lower(first_name)=? OR lower(last_name)=?',params[:name].downcase, params[:name].downcase)
    else
      students = Student.all
    end
      render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
