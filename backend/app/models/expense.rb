class Expense < ApplicationRecord
  belongs_to :category

  validates :description, presence: true
  validates :amount, presence: true,
                    numericality: { greater_than: 0, allow_nil: true }
  validates :date, presence: true, comparison: { less_than_or_equal_to: -> { Date.today }, message: "must not be a future date" }
end
