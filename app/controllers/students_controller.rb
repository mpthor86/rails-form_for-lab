class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        @student = Student.create(strong_params)
        redirect_to student_path(@student)
    end

    def show
        find_student
    end

    def edit
        find_student
    end

    def update
        find_student
        @student.update(strong_params)
        redirect_to student_path(@student)
    end 

    private
    def find_student
        @student = Student.find_by(params[:id])
    end

    def strong_params
        params.require(:student).permit(:first_name, :last_name)
    end
end
