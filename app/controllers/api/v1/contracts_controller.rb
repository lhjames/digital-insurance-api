# frozen_string_literal: true

module Api
  module V1
    class ContractsController < ApplicationController
      def index
        contracts = Contract.all
        render json: contracts, status: 200
      end

      def show
        contract = Contract.find_by(id: params[:id])
        if contract
          render json: contract, status: 200
        else
          render json: { error: 'Contract not found' }
        end
      end

      def create
        authorize! :create, Contract
        contract = Contract.new(
          start_date: contract_params[:start_date],
          end_date: contract_params[:end_date],
          customers: contract_params[:customers],
          options: contract_params[:options]
        )
        @contract.customer_id = current_user.id

        if contract.save
          render json: contract, status: 200
        else
          render json: { error: 'Error creating contract' }
        end
      end

      def delete
        contract = Contract.find_by(id: params[:id])
        if contract.destroy
          render json: contracts, status: 200
        else
          render json: { error: 'Contract was not deleted' }
        end
      end

      private

      def contract_params
        params.require(:contract).permit(%i[
                                           start_date
                                           end_date
                                           customers
                                           options
                                         ])
      end
    end
  end
end
