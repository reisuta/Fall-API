class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @q = Subscription.ransack(params[:q])
    @subscriptions = @q.result.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash[:success] = 'サブスクリプションを作成しました'
      redirect_to subscriptions_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @subscription.update(subscription_params)
      flash[:success] = 'サブスクリプションを更新しました'
      redirect_to subscription_path(@subscription.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @subscription.destroy
    flash[:success] = 'サブスクリプションを削除しました'
    redirect_to subscriptions_path
  end

  private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:name, :month_cost, :importance, :alternative)
    end
end
