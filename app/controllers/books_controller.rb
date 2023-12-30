class BooksController < ApplicationController
  def new
    # ビューへ渡すためのインスタンス変数にからのモデルオブジェクトを生成する
    @list = List.new
  end

  def index
  end

  def show
  end

  def edit
  end
end
