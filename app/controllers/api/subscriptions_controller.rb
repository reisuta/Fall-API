module Api
  class SubscriptionsController < ApplicationController
    before_action :set_subscription, only: [:show, :edit, :update, :destroy]

    def index
      @subscriptions = Subscription.all
      total = 0
      @subscriptions.each do |f|
        total = total + f.month_cost
      end
      @total = total
    end

    def show
    end

    def new
      @subscription = Subscription.new
    end

    def create
      @subscription = Subscription.new(subscription_params)
      if @subscription.save
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
      def set_subscription
        @subscription = Subscription.find(params[:id])
      end

      def subscription_params
        params.require(:subscription).permit(:name, :month_cost, :importance, :alternative)
      end
  end
end
