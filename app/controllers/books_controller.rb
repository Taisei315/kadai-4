class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def show
    @bookid = Book.find(params[:id])
    @books = Book.where(title: @bookid.title)
    @book = Book.new
    @user = @bookid.user
    @book_comment = BookComment.new

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image, :user)
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
