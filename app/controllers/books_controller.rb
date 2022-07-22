class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  
  def index
  end

  def show
  end
  
  def destroy
  end

  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:book_name, :image :caption)
  end
  
  
end
