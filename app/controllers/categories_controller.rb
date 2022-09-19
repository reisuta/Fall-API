class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'カテゴリーを作成しました'
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'カテゴリーを更新しました'
      redirect_to category_path(@category.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'カテゴリーを削除しました'
    redirect_to categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
