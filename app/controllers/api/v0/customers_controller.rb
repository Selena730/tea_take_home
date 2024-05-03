class Api::V0::CustomersController < ApplicationController
    protect_from_forgery with: :null_session # return to Stack Overflow  
    
    def create
        @customer = Customer.new(customer_params)
        if @customer.save
          render json: @customer, status: :created
        else
          render json: @customer.errors, status: :bad_request
        end
    end

    def index
       @customers = Customer.all
       render json: CustomerSerializer.new(@customers).serializable_hash.to_json
    end

    def show
        @customer = Customer.find(params[:id])
        render json: CustomerSerializer.new(@customer).serializable_hash.to_json
    end

    private 

    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :email, :address)
    end
    # not required 
    # list all customers (index)

    # show every customer and their subscriptions

    # json object:
    # top level(customer)
    # {
    #     customer info

    #     subscriptions:
    #     [an array of customers subscriptions (hashes){
    #         sub1 
    #     }
    #     {
    #         sub 2
    #     }]
    # }
end