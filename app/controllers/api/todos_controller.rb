module Api
  class TodosController < ApplicationController
    protect_from_forgery except: [:create, :update, :destroy]
    before_action :set_todo, only: [:show, :edit, :update, :destroy]

    def index
      @todos = Todo.all
    end

    def show
    end

    def new
      @todo = Todo.new
    end

    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        render json: @document, status: :ok
      else
        render json: { errors: @document.errors }, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      @todo.update(todo_params)
      flash[:success] = '目標を更新しました'
      render json: @todo, status: :ok
    end

    def destroy
    end

    private
      def set_todo
        @todo = Todo.find(params[:id])
      end

      def todo_params
        params.require(:todo).permit(:title, :status)
      end
  end
end
