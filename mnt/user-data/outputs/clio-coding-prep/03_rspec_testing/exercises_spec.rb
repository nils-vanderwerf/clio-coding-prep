require 'pry'
require 'date'
require_relative '../02_classes_oop/exercises'

# Topic 3 — RSpec & Testing
# Run with: rspec 03_rspec_testing/exercises_spec.rb
#
# Core patterns: describe, context, let, subject, before, expect, matchers
# Think about: happy path, sad path, edge cases, boundary conditions
# In the interview: write tests BEFORE or ALONGSIDE your implementation

# ─────────────────────────────────────────────
# Exercise 1 — Test BankAccount
# ─────────────────────────────────────────────

RSpec.describe BankAccount do
  let(:account) { BankAccount.new }

  describe "#balance" do
    context 'when a new account is opened' do
      it 'returns 0 for the new account' do
        expect(account.balance).to eq(0)
      end
    end
    context 'after a deposit' do
      it 'updates the balance' do
        account.deposit(50)
        expect(account.balance).to eq(50)
      end
    end
  end

  describe "#deposit" do
    context "when a normal deposit is made" do
      it 'increases the balance by that amount' do
        account.deposit(50)
        expect(account.balance).to eq(50)
      end
    end
    context "when a zero or negative deposit is entered" do
      it 'ignores it and does not throw an error' do
        expect { account.deposit(-30) }.not_to raise_error
        expect { account.deposit(0) }.not_to raise_error
        expect(account.balance).to eq(0)
      end
    end
  end

  describe "#withdraw" do
    context "when funds are sufficient" do
      it 'withdraws that amount from the balance' do
        account.deposit(100)
        account.withdraw(30)
        expect(account.balance).to eq(70)
      end
    end

    context "when funds are insufficient" do
      it 'returns an insufficient funds message' do
        account.deposit(100)
        expect(account.withdraw(130)).to eq("insufficient funds")
        expect(account.balance).to eq(100)
      end
    end

    context "with invalid amounts" do
      it 'ignores it and does not throw an error' do
        expect { account.withdraw(-30) }.not_to raise_error
        expect { account.withdraw(0) }.not_to raise_error
        expect(account.balance).to eq(0)
      end
    end
  end

  describe "#to_s" do
    context 'when user wants to display the balance' do
      it 'returns a formatted string' do
        account.deposit(100)
        expect(account.to_s).to eq("Account balance: $100")
      end
    end
  end
end

# ─────────────────────────────────────────────
# Exercise 2 — Test a Calculator class
# ─────────────────────────────────────────────
# First write the tests, THEN implement the class to make them pass.
# Calculator should support: add, subtract, multiply, divide
# divide should raise ArgumentError if divisor is 0

class Calculator
  def initialize
  end

  def add(n1, n2)
    n1 + n2
  end

  def subtract(n1, n2)
    n1 - n2
  end

  def multiply(n1, n2)
    n1 * n2
  end

  def divide(n1, n2)
    raise ArgumentError, "cannot divide by zero" if n2 == 0
    n1 / n2
  end
end

RSpec.describe Calculator do
  let(:calc) { Calculator.new }

  describe '#add' do
    context 'adding numbers together' do
      it 'adds them correctly' do
        expect(calc.add(2, 7)).to eq(9)
      end
    end
  end

  describe '#subtract' do
    context 'subtracts numbers from one another' do
      it 'subtracts them correctly' do
        expect(calc.subtract(9, 3)).to eq(6)
      end
    end
  end

  describe '#multiply' do
    context 'multiplies two numbers together' do
      it 'multiplies them correctly' do
        expect(calc.multiply(9, 3)).to eq(27)
      end
    end
  end

  describe '#divide' do
    context 'when dividing by a number apart from zero' do
      it 'raises an error' do
        expect(calc.divide(6, 3)).to eq(2)
      end
    end
    context 'when dividing by zero' do
      it 'raises an error' do
        expect{ calc.divide(5, 0) }.to raise_error(ArgumentError)
      end
    end
  end
end

# ─────────────────────────────────────────────
# Exercise 3 — Test MatterTracker
# ─────────────────────────────────────────────

RSpec.describe MatterTracker do
  let(:tracker) { MatterTracker.new }

  before do
    tracker.add("Smith v Jones", Date.today + 10)
  end

  describe "#add" do
    it 'increases the count' do
      expect(tracker.count).to eq(1)
    end

    it 'adds the matter as open' do
      expect(tracker.open_matters.first[:title]).to eq("Smith v Jones")
    end
  end

  describe "#close" do
    context "when matter exists" do
      it 'closes an open matter' do
        tracker.close("Smith v Jones")
        expect(tracker.open_matters).to be_empty
      end
    end

    context "when matter does not exist" do
      it 'returns a message indicating the matter was not found' do
        expect(tracker.close("Something random")).to eq("Matter not found")
      end
    end
  end

  describe "#overdue" do
    context 'when a matter is open and past due' do
      before { tracker.add("Overdue Matter", Date.today - 10) }

      it 'identifies it as an overdue matter' do
        expect(tracker.overdue.count).to eq(1)
      end
    end

    context 'when a matter is closed and past due' do
      before do
        tracker.add("Old Closed Matter", Date.today - 10)
        tracker.close("Old Closed Matter")
      end

      it 'does not include it in overdue' do
        expect(tracker.overdue.count).to eq(0)
      end
    end
  end
end

# ─────────────────────────────────────────────
# Exercise 4 — Test a Stack
# ─────────────────────────────────────────────

RSpec.describe Stack do
  let(:stack) { Stack.new }
  before do
    stack.push("first")
    stack.push("second")
    stack.push("third")
  end

  describe '#push' do
    context 'when new items added to the stack' do
      it 'increases the size' do
        expect(stack.size).to eq(3)
      end
    end
  end

  describe '#peek' do
    context 'when new items added to the stack' do
      it 'does not remove the item' do
        stack.peek
        expect(stack.size).to eq(3)
      end
    end
  end

  describe '#pop' do
    context 'when items are popped from the list' do
      it 'removes them from the end of the stack' do
        expect(stack.pop).to eq("third")
        expect(stack.size).to eq(2)
      end
    end
    context 'when stack is empty' do
      it 'returns nil' do
        stack.pop; stack.pop; stack.pop
        expect(stack.pop).to be_nil
      end
    end
  end

  describe '#empty?' do
    let(:empty_stack) { Stack.new }

    context 'when stack is empty' do
      it 'returns true' do
        expect(empty_stack.empty?).to be true
      end
    end
    context 'when stack has items in it' do
      it 'returns false' do
        expect(stack.empty?).to be false
      end
    end
  end

  describe '#size' do
    context 'when querying number of items in a stack' do
      it 'returns the number of items' do
        expect(stack.size).to eq(3)
      end
    end
  end
end

# ─────────────────────────────────────────────
# Exercise 5 — Test TimesheetEntry
# ─────────────────────────────────────────────

RSpec.describe TimesheetEntry do
  let(:valid_entry)   { TimesheetEntry.new("Consultation", 2.0, 300.0) }
  let(:invalid_entry) { TimesheetEntry.new("", 0, -50) }

  describe "#total" do
    context 'when multiplying hours by rate per hour' do
      it 'gives the correct total' do
        expect(valid_entry.total).to eq(600.00)
      end
    end
    context 'when result has more than 2 decimal places' do
      it 'rounds to 2 decimal places' do
        unrounded_entry = TimesheetEntry.new("Test", 2.0, 33.3333)
        expect(unrounded_entry.total).to eq(66.67)
      end
    end
  end

  describe "#billable?" do
    context "when rate per hour and hours are both greater than zero" do
      it "returns true on the timesheet being billable" do
        expect(valid_entry.billable?).to be true
      end
    end
    context "when rate per hour is below or equal to zero" do
      let(:low_rate_entry) { TimesheetEntry.new("Test", 2.0, -300.0) }
      
      it "returns false on the timesheet being billable" do
         expect(low_rate_entry.billable?).to be false
      end
    end
    context "when hours are below or equal to zero" do
      let(:low_hour_entry) { TimesheetEntry.new("Test", -2.0, 300.0) }
      it "returns false on the timesheet being billable" do
        expect(low_hour_entry.billable?).to be false
      end
    end
  end

  describe "#valid?" do
    context "with a valid entry" do
      it 'returns true' do
        expect(valid_entry.valid?).to be true
      end
    end

    context "with invalid description" do
      it 'returns false' do
        expect(invalid_entry.valid?).to be false
      end
    end

    context "with invalid hours" do
      let(:too_few_hours)      { TimesheetEntry.new("Test 1", 0.05, 300.0) }
      let(:lower_boundary)     { TimesheetEntry.new("Test 2", 0.1, 300.0) }
      let(:upper_boundary)     { TimesheetEntry.new("Test 3", 24, 300.0) }
      let(:too_many_hours)     { TimesheetEntry.new("Test 4", 25, 300.0) }

      it 'returns false below minimum hours' do
        expect(too_few_hours.valid?).to be false
      end

      it 'returns true at lower boundary (0.1)' do
        expect(lower_boundary.valid?).to be true
      end

      it 'returns true at upper boundary (24)' do
        expect(upper_boundary.valid?).to be true
      end

      it 'returns false above maximum hours' do
        expect(too_many_hours.valid?).to be false
      end
    end

    context "with invalid rate" do
     let(:invalid_rate_entry)     { TimesheetEntry.new("Invalid Rate Test", 1.0, -50.0) }
     let(:zero_rate_entry) { TimesheetEntry.new("Zero Rate", 1.0, 0) }

     it 'returns false if a negative rate is entered' do
        expect(invalid_rate_entry.valid?).to be false
      end

      it 'returns false if rate is zero' do
        expect(zero_rate_entry.valid?).to be false
      end
    end
  end

  describe "#to_s" do
    context "when description, hours and rate per hour are entered correctly" do
      let(:entry) { TimesheetEntry.new("Client consultation", 2.5, 350.0) }
      let(:description) { "Client consultation: (2.5h @ $350.0/h) = $875.0"}

      it "formats it as required" do
        expect(entry.to_s).to eq(description)
      end
    end
  end
end
