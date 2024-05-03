require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationships" do 
    it { should have_many :subscriptions }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_uniqueness_of(:email) }
  end

  it "has a valid factory" do
    customer = build(:customer)
    expect(customer).to be_valid
  end

  it "creates a customer with all attributes" do
    customer = create(:customer)
    expect(customer.first_name).not_to be_nil
    expect(customer.last_name).not_to be_nil
    expect(customer.email).not_to be_nil
    expect(customer.address).not_to be_nil
  end
end
