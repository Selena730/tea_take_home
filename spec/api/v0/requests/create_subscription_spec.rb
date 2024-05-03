require 'rails_helper'

RSpec.describe "Create Subscription for Customer", type: :request do
  before(:each) do
    @customer = create(:customer)
    @tea = create(:tea)
    @headers = {"CONTENT_TYPE" => "application/json"}
  end

    describe "/api/v0/customers/:customer_id/subscriptions" do
        it "creates a subscription for a customer" do 
            @body = {tea_id: @tea.id, customer_id: @customer.id, price: 20.00, frequency: 11, status: 0, title: "Monthly Premium Tea"}

            post "/api/v0/customers/#{@customer.id}/subscriptions", headers: @headers, params: JSON.generate(@body)

            json_response = JSON.parse(response.body, symbolize_names: true)
            expect(response).to have_http_status(:created)
            expect(json_response[:data][:attributes][:title]).to eq("Monthly Premium Tea")
            expect(json_response[:data][:attributes][:status]).to eq("active")
        end

        it "returns a 400 error" do # sad path
            create(:subscription, customer: @customer, tea: @tea, frequency: 11)
            
            @body = {tea_id: @tea.id, customer_id: @customer.id, price: 20.00, frequency: 11, status: 0, title: "Monthly Premium Tea"}

            post "/api/v0/customers/#{@customer.id}/subscriptions", headers: @headers, params: JSON.generate(@body)

            expect(response).to have_http_status(:bad_request)
        end
    end
end