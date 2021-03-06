class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    @student.update(params.require(:student).permit(:first_name, :last_name))
      redirect_to student_path(@student)

  end

  def new
  end

  def destroy
    @student = Student.find(params[:id]).destroy
    redirect_to students_path
  end

  def create
    @student = Student.create(
    {
      first_name: params[:first_name],
      last_name:  params[:last_name]
    }
    )
    
    redirect_to student_path(@student)
  end

end
