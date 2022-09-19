class Subscription < ApplicationRecord
  validates :name, presence: true
  validates :month_cost, presence: true
  enum importance: { low: 0, middle: 1, high: 2 }
end
