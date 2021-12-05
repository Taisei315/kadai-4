class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:success] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      @current_user = @user
      render :edit
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body, :image, :user)
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
