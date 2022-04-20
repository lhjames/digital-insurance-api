class Api::V1::ContractsController < ApplicationController
  def index
    contracts = Contract.all
    render json: contracts, status: 200
  end

  def show
    contract = Contract.find_by(id: params[:id])
    if contract
      render json: contract, status: 200
    else
      render json: {error: "Contract not found"}
    end
  end

  def create
    contract = Contract.new(
      start_date: contract_params[:start_date],
      end_date: contract_params[:end_date],
      customers: contract_params[:customers],
      options: contract_params[:options]
    )
    if contract.save
      render json: contract, status: 200
    else
      render json: {error: "Error creating contract"}
    end
  end

  def edit
  end

  def update
  end

  def delete
    contract = Contract.find_by(id: params[:id])
    if contract.destroy
      render json: contracts, status: 200
    else
      render json: {error: "Contract was not deleted"}
    end
  end

  private

  def contract_params
    params.require(:contract).permit([
      :start_date, 
      :end_date,
      :customers,
      :options
    ])
  end
end