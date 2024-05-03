require 'rails_helper'

RSpec.describe "Cancel Subscription for Customer", type: :request do
    before(:each) do
      @customer = create(:customer)
      @tea = create(:tea)
      @subscription = create(:subscription, customer: @customer, tea: @tea, status: 'active')
      @headers = {"CONTENT_TYPE" => "application/json"}
    end
  
    describe "PATCH /api/v0/customers/:customer_id/subscriptions/:id" do
        it "cancels a subscription for a customer" do
          update_params = { status: "cancelled" }.to_json
          patch "/api/v0/customers/#{@customer.id}/subscriptions/#{@subscription.id}", headers: @headers, params: update_params
    
          json_response = JSON.parse(response.body, symbolize_names: true)
        #   binding.pry
          expect(response).to have_http_status(:ok)
          expect(json_response[:message]).to eq('Subscription Cancelled')
          expect(@subscription.reload.status).to eq('cancelled')
        end
    end
end