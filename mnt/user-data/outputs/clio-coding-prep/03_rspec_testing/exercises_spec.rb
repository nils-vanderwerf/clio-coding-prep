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
  # paste your implementation here
end

RSpec.describe BankAccount do
  let(:account) { BankAccount.new }

  describe "#balance" do
    # your tests here
  end

  describe "#deposit" do
    # your tests here
    # think about: normal deposit, zero amount, negative amount
  end

  describe "#withdraw" do
    context "when funds are sufficient" do
      # your tests here
    end

    context "when funds are insufficient" do
      # your tests here
      # think about: returns correct message AND doesn't change balance
    end

    context "with invalid amounts" do
      # your tests here
    end
  end

  describe "#to_s" do
    # your tests here
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

# paste MatterTracker class here

RSpec.describe MatterTracker do
  let(:tracker) { MatterTracker.new }

  describe "#add" do
    # your tests here
  end

  describe "#close" do
    context "when matter exists" do
      # your tests here
    end

    context "when matter does not exist" do
      # your tests here
    end
  end

  describe "#overdue" do
    # this is the most important one to test well
    # think about: past due open, past due closed, future due open
    # your tests here
  end
end

# ─────────────────────────────────────────────
# Exercise 4 — Test a Stack
# ─────────────────────────────────────────────
# Write comprehensive RSpec for your Stack class.
# Pay attention to: order of operations, empty stack behaviour, peek vs pop

# paste Stack class here

RSpec.describe Stack do
  let(:stack) { Stack.new }

  # your tests here
  # make sure to test the LIFO (last in first out) behaviour explicitly
  # test all edge cases for empty stack
end

# ─────────────────────────────────────────────
# Exercise 5 — Test TimesheetEntry
# ─────────────────────────────────────────────
# Write RSpec for TimesheetEntry.
# Use before blocks and multiple let values to set up different scenarios efficiently.

# paste TimesheetEntry class here

RSpec.describe TimesheetEntry do
  let(:valid_entry)   { TimesheetEntry.new("Consultation", 2.0, 300.0) }
  let(:invalid_entry) { TimesheetEntry.new("", 0, -50) }

  describe "#total" do
    # your tests here — test rounding too
  end

  describe "#valid?" do
    context "with a valid entry" do
      # your tests here
    end

    context "with invalid description" do
      # your tests here
    end

    context "with invalid hours" do
      # test boundaries: 0, 0.1, 24, 24.1
      # your tests here
    end

    context "with invalid rate" do
      # your tests here
    end
  end

  describe "#to_s" do
    # your tests here
  end
end
