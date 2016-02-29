require 'byebug'

class UsersController < ApplicationController
  def index
    # debugger
    render json: User.all
    #render json: {'a_key' => 'a value'}
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update(params[:user].permit(:name, :email))
      render json: user
    else
      render(
        json: user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.delete
      render json: user
    else
      render(
        json: user.errors.full_messages,
        status: :not_found
      )
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
