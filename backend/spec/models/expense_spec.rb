require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject(:expense) { build(:expense) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(expense).to be_valid
    end

    it "is invalid without a description" do
      expense.description = nil

      expect(expense).not_to be_valid
      expect(expense.errors[:description]).to include("can't be blank")
    end

    it "is invalid without an amount" do
      expense.amount = nil

      expect(expense).not_to be_valid
      expect(expense.errors[:amount]).to include("can't be blank")
    end

    it "is invalid when amount is zero" do
      expense.amount = 0

      expect(expense).not_to be_valid
      expect(expense.errors[:amount]).to include("must be greater than 0")
    end

    it "is invalid when amount is negative" do
      expense.amount = -1

      expect(expense).not_to be_valid
      expect(expense.errors[:amount]).to include("must be greater than 0")
    end

    it "is invalid without a date" do
      expense.date = nil

      expect(expense).not_to be_valid
      expect(expense.errors[:date]).to include("can't be blank")
    end

    it "is invalid without a category" do
      expense.category = nil

      expect(expense).not_to be_valid
      expect(expense.errors[:category]).to include("must exist")
    end
  end
end