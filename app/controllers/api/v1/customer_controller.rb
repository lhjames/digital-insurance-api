# frozen_string_literal: true

module Api
  module V1
    class CustomerController < ApplicationController
      def index
        authorize! :index, Customer
        customers = Customer.all
        render json: customers, status: 200
      end

      def show
        authorize! :manage, Customer
        customer = Customer.find_by(id: params[:id])
        if customer
          render json: customer, status: 200
        else
          render json: { error: 'Customer account not found' }
        end
      end

      def create
        authorize! :create, Customer
        customer = Customer.new(
          email: customer_params[:email],
          password: customer_params[:password]
        )
        if customer.save
          render json: customer, status: 200
        else
          render json: { error: 'Error creating customer account' }
        end
      end

      def delete
        authorize! :delete, Customer
        customer = Customer.find_by(id: params[:id])
        if customer.destroy
          render json: customers, status: 200
        else
          render json: { error: 'Customer account was not deleted' }
        end
      end

      private

      def customer_params
        params.require(:customer).permit(%i[
                                           email
                                           password
                                         ])
      end
    end
  end
end
