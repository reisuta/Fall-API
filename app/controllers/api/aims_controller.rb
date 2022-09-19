module Api
  class AimsController < ApplicationController
    before_action :set_aim, only: [:show, :edit, :update, :destroy]

    def index
      @aims = Aim.all
    end

    def show
    end

    def new
      @aim = Aim.new
    end

    def create
      @aim = Aim.new(aim_params)
      if @aim.save
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
      def set_aim
        @aim = Aim.find(params[:id])
      end

      def aim_params
        params.require(:aim).permit(:title, :reason, :advantage, :genre, :difficulty, :started_at, :ended_at, { category_ids: [] })
      end
  end
end
