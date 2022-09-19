module Api
  class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
      @books = Book.all
    end

    def show
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        render json: @document, status: :ok
      else
        render json: { errors: @document.errors }, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
      def set_book
        @book = Book.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title, :author, :amount, :is_library, :bought_at, :started_at, :ended_at)
      end
  end
end
