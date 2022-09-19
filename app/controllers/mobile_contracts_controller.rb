class MobileContractsController < ApplicationController
  before_action :set_mobile_contract, only: [:show, :edit, :update, :destroy]

  def index
    @q = MobileContract.ransack(params[:q])
    @mobile_contracts = @q.result.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @mobile_contract = MobileContract.new
  end

  def create
    @mobile_contract = MobileContract.new(mobile_contract_params)
    if @mobile_contract.save
      flash[:success] = 'スマホ契約を作成しました'
      redirect_to mobile_contracts_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @mobile_contract.update(mobile_contract_params)
      flash[:success] = 'スマホ契約を更新しました'
      redirect_to mobile_contract_path(@mobile_contract.id)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @mobile_contract.destroy
    flash[:success] = 'スマホ契約を削除しました'
    redirect_to mobile_contracts_path
  end

  private
    def set_mobile_contract
      @mobile_contract = MobileContract.find(params[:id])
    end

    def mobile_contract_params
      params.require(:mobile_contract).permit(:company_name, :month_cost, :cancel_cost, :contract_detail, :started_at, :ended_at)
    end
end
