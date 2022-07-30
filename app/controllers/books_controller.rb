class BooksController < ApplicationController

  before_action :correct_user, only: [:edit,:destroy]


  def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user_id
      redirect_to books_path
    end
  end


  #indexアクションは一覧画面ようのアクションとして定義します。
  #一覧画面には投稿したBook全てを表示させるので、全てのデータを取得する記述をします。
  #Controllerのアクションでインスタンス変数を指定しておくことで、
  #viewファイル上でインスタンス変数に格納された情報を表示させることができます。
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end


  def edit
    @book = Book.find(params[:id])
    if @book.user_id = current_user.id
      render "edit"
    else
      redirect_to books_path
    end
  end


  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def update
    @book = Book.find(params[:id])
    #ユーザーの取得
    @book.user_id = current_user.id
    if @book.update(book_params)
        #ユーザーのアップデート
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
      #ユーザーの詳細ページへのパス
    else
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
