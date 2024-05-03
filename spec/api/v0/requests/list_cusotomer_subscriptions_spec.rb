require 'rails_helper'

RSpec.describe "List Subscriptions for Customer", type: :request do
  before do
    @customer = create(:customer)
    @tea = create(:tea)
    @subscription = create(:subscription, customer: @customer, tea: @tea, status: 'active')
    @headers = {"CONTENT_TYPE" => "application/json"}
  end

  describe "GET /api/v0/customers/:customer_id" do
    it "receives a successful response" do
      get "/api/v0/customers/#{@customer.id}" , headers: @headers
      expect(response).to have_http_status(:ok)
    end
  end
end
