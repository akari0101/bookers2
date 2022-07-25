class BooksController < ApplicationController


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

  #indexアクションは一覧画面ようのアクションとして定義します。
  #一覧画面には投稿したBook全てを表示させるので、全てのデータを取得する記述をします。
  #Controllerのアクションでインスタンス変数を指定しておくことで、
  #viewファイル上でインスタンス変数に格納された情報を表示させることができます。
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
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
    params.require(:book).permit(:title, :body)
  end


end
