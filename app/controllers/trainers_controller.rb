class TrainersController < ApplicationController
  before_action :set_trainer, only: [:account_details, :edit_profile, :delete_account]

  def sign_up
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      render json: {id:@trainer.id, message: 'account created successfully', status: :created}
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    @trainer = Trainer.authenticate(params[:email], params[:password])
    if @trainer
      render json: {id:@trainer.id, message: 'logged in successfully', isLoggedIn: true}
    else
      render json: {message: 'invalid credentials', isLoggedIn: false}
    end
  end

  def account_details
    render json: {
      "id": @trainer.id,
      "first_name": @trainer.first_name,
      "last_name": @trainer.last_name,
      "email": @trainer.email,
      "description": @trainer.description,
      "created_at": @trainer.created_at,
      "updated_at": @trainer.updated_at
  }
  end

  def edit_profile
    if @trainer.update(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  def delete_account
    if @trainer.destroy
      render json: {message: 'account successfully deleted'}
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end


  private
  def set_trainer
    @trainer = Trainer.find(params[:id])
  end

  def trainer_params
    params.permit(:first_name, :last_name, :email, :description, :password, :password_confirmation, :encrypted_password)
  end
end
