class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    # データを取得する
    @book = Book.find(params[:id])
  end

  def edit
    # データを取得する
    @book = Book.find(params[:id])
  end

  def update # 編集の更新の記述
    @book = Book.find(params[:id])
    @book.update(book_params)
    # フラッシュメッセージを定義し、編集ページを更新する
    flash[:notice] = "更新に成功しました！"
    redirect_to book_path(@book.id)
  end

  def destroy # 投稿データ削除の記述
    @book = Book.find(params[:id])
    @book.destroy
    # フラッシュメッセージを定義し、一覧ページを更新する
    flash[:notice] = "削除に成功しました！"
    redirect_to books_path(@book.id)
  end

  def create # 投稿する記述
    @book = Book.new(book_params)
    if @book.save
      # フラッシュメッセージを定義し、詳細ページに遷移する
      flash[:notice] = "投稿に成功しました！"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
