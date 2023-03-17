class StudentsController < ApplicationController
  def sign_up
    @student = Student.new(student_params)

    if @student.save
      render json: {message:'account created successfully',status: :created }
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    @student = Student.authenticate(params[:email], params[:password])
    if @student
      render json: {message: 'logged in successfully', isLoggedIn: true}
    else
      render json: {message: 'invalid credentials', isLoggedIn: false}
    end
  end

  private
  def student_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :encrypted_password)
  end
end
