class Api::V1::OptionsController < ApplicationController
  def index
    options = Option.all
    render json: options, status: 200
  end

  def show
    option = Option.find_by(id: params[:id])
    if option
      render json: option, status: 200
    else
      render json: {error: "Option not found"}
    end
  end

  def create
    option = Option.new(
      name: option_params[:name],
      description: option[:description],
      contract_id: option_params[:contract_id],
    )
    if option.save
      render json: option, status: 200
    else
      render json: {error: "Error creating option"}
    end
  end

  def delete
    option = Option.find_by(id: params[:id])
    if option.destroy
      render json: options, status: 200
    else
      render json: {error: "Option was not deleted"}
    end
  end

  private

  def option_params
    params.require(:option).permit([
      :name, 
      :description,
      :contract_id,
    ])
  end
end
