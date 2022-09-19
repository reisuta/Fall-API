class Category < ApplicationRecord
  validates :name, presence: true
  has_many :aim_categories
  has_many :aims, through: :aim_categories
end
