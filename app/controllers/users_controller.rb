class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    flash[:notice]="You have updated user successfully."
  end
end


private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

