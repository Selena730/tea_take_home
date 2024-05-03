require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "relationships" do
    it { should have_many :subscriptions }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:brew_time) }
    it { should validate_presence_of(:temperature) }
    it { should validate_numericality_of(:brew_time) } 
    it { should validate_numericality_of(:temperature) } 

  end

  it "has a valid factory" do
    tea = build(:tea)
    expect(tea).to be_valid
  end

  it "creates tea with realistic attributes" do
    tea = create(:tea)
    expect(tea.title).to be_a(String)
    expect(tea.description).to be_a(String)
    expect(tea.temperature).to be_between(60, 100)
    expect(tea.brew_time).to be_between(1, 5)
  end
end
