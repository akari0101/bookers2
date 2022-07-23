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

  #indexアクションは一覧画面ようのアクションとして定義します。
  #一覧画面には投稿したBook全てを表示させるので、全てのデータを取得する記述をします。
  #Controllerのアクションでインスタンス変数を指定しておくことで、
  #viewファイル上でインスタンス変数に格納された情報を表示させることができます。
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
  end


  def create
    #flash[:notice]="You have creatad book successfully."
  end
  
  
  def update
    #flash[:notice]="Book was successfully updated."
  end
  
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
      flash[:notice] = "Book was successfully destroyed."
    end
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:book_name, :image, :caption)
  end


end
