class Tea < ApplicationRecord
    has_many :subscriptions

    validates :title, presence: true
    validates :description, presence: true
    validates :temperature, presence: true, numericality: true
    validates :brew_time, presence: true, numericality: true
end
