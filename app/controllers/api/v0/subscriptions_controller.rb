class Api::V0::SubscriptionsController < ApplicationController
    protect_from_forgery with: :null_session

    def create 
        @subscription = Subscription.new(subscription_params)
        if @subscription.save
            render json: SubscriptionSerializer.new(@subscription).serializable_hash.to_json, status: :created
        else
            render json: @subscription.errors, status: :bad_request
        end
    end

    def update 
        @subscription = Subscription.find_by(id: params[:id])
        if @subscription
            if @subscription.update(status: "cancelled")
                render json: { message: "Subscription Cancelled" }
            else 
                render json: @subscription.errors, status: :bad_request
            end
        else
            render json: { message: "Subscription not found"}, status: :not_found
        end
    end

    private 

    def subscription_params
        params.require(:subscription).permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
    end
    # create, cancel, list all subscriptions
    # create(post), destroy(delete), index(get)
    # error handling 
end