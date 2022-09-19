class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = '本を作成しました'
      redirect_to books_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:success] = '本を更新しました'
      redirect_to book_path(@book.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    flash[:success] = '本を削除しました'
    redirect_to books_path
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :amount, :is_library, :bought_at, :started_at, :ended_at)
    end
end
