# Topic 2 — Classes & OOP
# Core concepts: initialize, instance variables, attr_accessor, instance methods,
# validation, state management, to_s
# Say your approach out loud. Think about: what state does this object hold?
# What can it do? What should it protect?

# ─────────────────────────────────────────────
# Exercise 1 — BankAccount
# ─────────────────────────────────────────────
# Build a BankAccount class:
#   - Starts with a balance of 0
#   - deposit(amount)  — adds to balance, returns new balance
#                        ignores zero or negative amounts (no error)
#   - withdraw(amount) — subtracts from balance, returns new balance
#                        returns "insufficient funds" if it would go negative
#                        ignores zero or negative amounts (no error)
#   - balance          — returns current balance
#   - to_s             — returns "Account balance: $X"

class BankAccount
  attr_reader :balance

  def initialize  # your code here
    @balance = 0 
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

account = BankAccount.new
account.deposit(100)
account.deposit(50)
account.withdraw(30)
puts account.balance        # 120
puts account.withdraw(200)  # "insufficient funds"
puts account.balance        # still 120
puts account                # Account balance: $120

# ─────────────────────────────────────────────
# Exercise 2 — TodoList
# ─────────────────────────────────────────────
# Build a TodoList class:
#   - Items start empty
#   - add(item)       — adds a string item to the list
#   - complete(item)  — marks an item as done (ignore if item doesn't exist)
#   - pending         — returns array of items not yet completed
#   - completed       — returns array of completed items
#   - summary         — returns "X done, Y pending"

class TodoList
  # your code here
end

list = TodoList.new
list.add("Buy milk")
list.add("Walk dog")
list.add("Write tests")
list.complete("Buy milk")
list.complete("nonexistent") # should not raise an error
p list.pending    # ["Walk dog", "Write tests"]
p list.completed  # ["Buy milk"]
puts list.summary # "1 done, 2 pending"

# ─────────────────────────────────────────────
# Exercise 3 — MatterTracker
# ─────────────────────────────────────────────
# Clio-flavoured. Build a MatterTracker class:
#   - Stores matters (each matter is a hash with :title, :status, :due_date)
#   - add(title, due_date)  — adds a matter with status "Open"
#   - close(title)          — changes a matter's status to "Closed"
#                             returns "Matter not found" if title doesn't exist
#   - open_matters          — returns array of matter hashes with status "Open"
#   - overdue               — returns matters where due_date < today and status != "Closed"
#   - count                 — returns total number of matters

require 'date'

class MatterTracker
  # your code here
end

tracker = MatterTracker.new
tracker.add("Smith v Jones", Date.today - 5)
tracker.add("Chen Lease", Date.today + 10)
tracker.add("Ali Estate", Date.today - 2)
tracker.close("Ali Estate")

puts tracker.count           # 3
p tracker.open_matters.map { |m| m[:title] }  # ["Smith v Jones", "Chen Lease"]
p tracker.overdue.map { |m| m[:title] }       # ["Smith v Jones"]
puts tracker.close("Nonexistent")              # "Matter not found"

# ─────────────────────────────────────────────
# Exercise 4 — Stack
# ─────────────────────────────────────────────
# Build a Stack class (last in, first out):
#   - push(item)  — adds item to top of stack
#   - pop         — removes and returns top item
#                   returns nil if stack is empty
#   - peek        — returns top item without removing it
#                   returns nil if stack is empty
#   - empty?      — returns true if stack has no items
#   - size        — returns number of items

class Stack
  # your code here
end

stack = Stack.new
stack.push("first")
stack.push("second")
stack.push("third")
puts stack.peek     # "third"
puts stack.pop      # "third"
puts stack.pop      # "second"
puts stack.size     # 1
puts stack.empty?   # false
stack.pop
puts stack.empty?   # true
puts stack.pop.nil? # true

# ─────────────────────────────────────────────
# Exercise 5 — TimesheetEntry
# ─────────────────────────────────────────────
# Clio-flavoured. Build a TimesheetEntry class for legal billing:
#   - initialize(description, hours, rate_per_hour)
#   - total         — returns hours * rate_per_hour, rounded to 2 decimal places
#   - billable?     — returns true if hours > 0 and rate > 0
#   - to_s          — returns "Description (Xh @ $Y/h) = $Z"
#   - valid?        — returns true only if description is non-empty,
#                     hours is between 0.1 and 24, rate is positive

class TimesheetEntry
  # your code here
end

entry = TimesheetEntry.new("Client consultation", 2.5, 350.0)
puts entry.total      # 875.0
puts entry.billable?  # true
puts entry.valid?     # true
puts entry            # Client consultation (2.5h @ $350.0/h) = $875.0

bad = TimesheetEntry.new("", 0, -50)
puts bad.valid?       # false
puts bad.billable?    # false
