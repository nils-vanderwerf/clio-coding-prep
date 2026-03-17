require 'pry'

# Topic 3 — RSpec & Testing
# Run with: rspec 03_rspec_testing/exercises_spec.rb
#
# Core patterns: describe, context, let, subject, before, expect, matchers
# Think about: happy path, sad path, edge cases, boundary conditions
# In the interview: write tests BEFORE or ALONGSIDE your implementation

# ─────────────────────────────────────────────
# Exercise 1 — Test BankAccount
# ─────────────────────────────────────────────
# Copy your BankAccount class here (or require it), then write full RSpec coverage.
# You should have at least 8 tests covering all methods and edge cases.

class BankAccount
  def initialize  # your code here
    @balance = 0 
  end

  def balance
    @balance
  end

  def deposit(amount)
    return if zero_or_negative?(amount)
    @balance += amount
  end

  def withdraw(amount)
    return if zero_or_negative?(amount)
    return "insufficient funds" if @balance - amount < 0 
    @balance -= amount
  end

  def to_s
    "Account balance: $#{@balance}"
  end

  private

  def zero_or_negative?(amount)
    amount <= 0
  end
end

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
      it 'ignores it and does dot throw an error' do
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
      it 'ignores it and does dot throw an error' do
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
  # implement after writing tests
end

RSpec.describe Calculator do
  let(:calc) { Calculator.new }

  # write tests for all four operations
  # make sure to test the divide by zero case
  # your tests here
end

# ─────────────────────────────────────────────
# Exercise 3 — Test MatterTracker
# ─────────────────────────────────────────────
# Write RSpec for your MatterTracker class from Topic 2.
# Focus on: adding matters, closing matters, overdue logic, edge cases

require 'date'

class MatterTracker
  def initialize
    @matters = []
  end

  def add(title, due_date)
    @matters << {title: title, status: "Open", due_date: due_date}
  end

  def close(title)
    matter = @matters.find {|m| m[:title] == title}
    return "Matter not found" if matter.nil?
    matter[:status] = "Closed"
  end

  def open_matters
    @matters.select {|m| m[:status] == "Open"}
  end

  def overdue
    @matters.select {|m| m[:due_date] < Date.today && m[:status] != "Closed"}
  end

  def count
    @matters.count 
  end
end

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
# Write comprehensive RSpec for your Stack class.
# Pay attention to: order of operations, empty stack behaviour, peek vs pop

class Stack
 def initialize
  @stack = []
 end

 def push(item)
  @stack << item
 end

 def peek
  return nil if @stack.empty?
  @stack.last
 end

 def pop
  return nil if @stack.empty?
  @stack.pop
 end

 def empty?
  @stack.empty?
 end

 def size
  @stack.size
 end
end

RSpec.describe Stack do
  let(:stack) { Stack.new }
  before do
    stack.push("first")
    stack.push("second")
    stack.push("third")
  end
  describe '#push' do
    context 'when new items added to the stack' do
      it 'puts them at the end' do
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
        stack.pop; stack.pop; stack.pop # run 3 times to empty it
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
# Write RSpec for TimesheetEntry.
# Use before blocks and multiple let values to set up different scenarios efficiently.

# paste TimesheetEntry class here

# RSpec.describe TimesheetEntry do
#   let(:valid_entry)   { TimesheetEntry.new("Consultation", 2.0, 300.0) }
#   let(:invalid_entry) { TimesheetEntry.new("", 0, -50) }

#   describe "#total" do
#     # your tests here — test rounding too
#   end

#   describe "#valid?" do
#     context "with a valid entry" do
#       # your tests here
#     end

#     context "with invalid description" do
#       # your tests here
#     end

#     context "with invalid hours" do
#       # test boundaries: 0, 0.1, 24, 24.1
#       # your tests here
#     end

#     context "with invalid rate" do
#       # your tests here
#     end
#   end

#   describe "#to_s" do
#     # your tests here
#   end
# end
