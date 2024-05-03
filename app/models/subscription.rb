class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates :status, presence: true
  validates :frequency, presence: true
  validates :tea_id, uniqueness: {scope: :customer_id, message: "subscription for this tea already exists" }

  enum :status, [ :active, :cancelled ]
end
