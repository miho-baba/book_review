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

  def dectoroy
  end

  def create
    book = Book.new(book_params)
    book.save
    # 詳細ページに遷移する
    redirect_to book_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
