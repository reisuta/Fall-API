class Todo < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true
  enum status: { waiting: 0, doing: 1, done: 2 }
end
