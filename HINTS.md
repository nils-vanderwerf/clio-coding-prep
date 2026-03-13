# HINTS.md — Nudges Only, No Solutions
# Read the hint for the specific exercise you're stuck on.
# Try again before reading the next hint.

---

## Topic 1 — Arrays & Hashes

### Exercise 1 — Frequency Counter
- Hint 1: You need a hash where key = number, value = count. What's the pattern for building a counting hash?
- Hint 2: `Hash.new(0)` means any missing key defaults to 0 — so `counts[item] += 1` always works
- Hint 3: `each_with_object(Hash.new(0))` is perfect here

### Exercise 2 — Group By First Letter
- Hint 1: Key = first letter of word (`word[0]` or `word.chars.first`). Value = array of words with that letter.
- Hint 2: You need to build up arrays inside your hash. What happens if the key doesn't exist yet?
- Hint 3: Try `Hash.new { |h, k| h[k] = [] }` — gives you an empty array as default instead of 0
- Hint 4: Ruby also has a built-in `group_by` method — try both approaches

### Exercise 3 — Top N Values
- Hint 1: Sort the array first. Which direction?
- Hint 2: `sort.reverse` gives you descending order. Or `sort_by { |n| -n }`
- Hint 3: `.first(n)` returns the first n elements — handles the "fewer than n" case automatically

### Exercise 4 — Invert Hash
- Hint 1: You want to flip every key-value pair. What is the key in the new hash? What is the value?
- Hint 2: Iterate over the original hash with `.each` — you get both key and value in the block
- Hint 3: Ruby has a built-in `.invert` method — use it, but know how to implement it manually too

### Exercise 5 — Matters Dashboard
- Hint 1: Break it into parts. Get :total first (that's just .count). Then :open (select + count).
- Hint 2: Overdue = due_date < Date.today AND status != "Closed". Both conditions must be true.
- Hint 3: :by_type is a counting hash — same pattern as Exercise 1 but counting matter_type values
- Hint 4: Build the result hash at the end: `{ total: ..., open: ..., overdue: ..., by_type: ... }`

---

## Topic 2 — Classes & OOP

### Exercise 1 — BankAccount
- Hint 1: You need one instance variable: `@balance`. Set it to 0 in `initialize`.
- Hint 2: For withdraw, check if amount > @balance BEFORE subtracting. Use early return.
- Hint 3: `to_s` should interpolate @balance into a string. Ruby calls `to_s` automatically with `puts`.
- Hint 4: For invalid amounts (zero/negative), just return early without doing anything — no error needed

### Exercise 2 — TodoList
- Hint 1: You need two instance variables — an array for pending items, an array for completed items.
- Hint 2: `complete(item)` needs to move an item from pending to completed. Check it exists first.
- Hint 3: `summary` uses string interpolation: `"#{completed.length} done, #{pending.length} pending"`

### Exercise 3 — MatterTracker
- Hint 1: Store matters as an array of hashes: `[{ title: "...", status: "Open", due_date: date }]`
- Hint 2: `close(title)` needs to find the matter by title first. Try `.find { |m| m[:title] == title }`
- Hint 3: Overdue = `due_date < Date.today && status != "Closed"`. Chain with `.select`.
- Hint 4: `count` is just `@matters.length`

### Exercise 4 — Stack
- Hint 1: A stack is just an array used a specific way. `@items = []` is all you need.
- Hint 2: `push` = `@items.push(item)` or `@items << item`
- Hint 3: `pop` = `@items.pop` — Ruby's array pop removes AND returns the last element. Returns nil if empty.
- Hint 4: `peek` = `@items.last` — doesn't remove anything. Returns nil if empty.

### Exercise 5 — TimesheetEntry
- Hint 1: Three instance variables: `@description`, `@hours`, `@rate`
- Hint 2: `total` = `(@hours * @rate).round(2)`
- Hint 3: `valid?` needs to check ALL conditions with `&&`
- Hint 4: `to_s` format: `"#{@description} (#{@hours}h @ $#{@rate}/h) = $#{total}"`

---

## Topic 3 — RSpec Testing

### General RSpec hints
- `let(:account) { BankAccount.new }` — creates a fresh instance for every test
- `before { account.deposit(100) }` — runs before every test in the block, good for setup
- Test ONE thing per `it` block — if you need "and", split into two tests
- Always test the sad path — what happens when it goes wrong?

### Exercise 1 — BankAccount tests
- Hint 1: You need at least: initial balance is 0, deposit increases balance, withdraw decreases balance,
  withdraw with insufficient funds returns message, withdraw with insufficient funds doesn't change balance
- Hint 2: Use `before { account.deposit(100) }` inside a describe block to avoid repeating setup
- Hint 3: Test that `withdraw(0)` and `deposit(-50)` don't change the balance

### Exercise 2 — Calculator
- Hint 1: Write the tests first, completely. Then make them pass one by one.
- Hint 2: `expect { calc.divide(5, 0) }.to raise_error(ArgumentError)`
- Hint 3: Test negative numbers and floats too

### Exercise 3 — MatterTracker
- Hint 1: For the overdue test, you need matters with specific dates. Use `Date.today - 5` for past dates.
- Hint 2: Test that a closed overdue matter does NOT appear in overdue
- Hint 3: `expect(tracker.overdue.map { |m| m[:title] }).to include("Smith v Jones")`

### Exercise 4 — Stack
- Hint 1: Test the LIFO property explicitly: push A, push B, pop should return B not A
- Hint 2: Test pop on empty stack returns nil — don't let it raise an error
- Hint 3: Test that peek doesn't change the size

### Exercise 5 — TimesheetEntry
- Hint 1: Test boundary values for hours: 0.0 (invalid), 0.1 (valid), 24.0 (valid), 24.1 (invalid)
- Hint 2: `expect(entry.total).to eq(875.0)` — test exact value including rounding
- Hint 3: Use multiple `let` values for different scenarios rather than creating objects inside each test

---

## Topic 4 — String Manipulation

### Exercise 1 — Palindrome
- Hint 1: Strip spaces and downcase first, then compare to its reverse
- Hint 2: `str.gsub(" ", "").downcase` removes spaces and lowercases in one step
- Hint 3: `cleaned == cleaned.reverse`

### Exercise 2 — Caesar Cipher
- Hint 1: Work character by character with `.chars.map`
- Hint 2: For each letter, get its ASCII value with `.ord`, shift it, convert back with `.chr`
- Hint 3: For lowercase: `((char.ord - 'a'.ord + n) % 26 + 'a'.ord).chr`
- Hint 4: Handle uppercase separately. Skip non-letter characters entirely.

### Exercise 3 — Title Case
- Hint 1: Split into words, then process each word
- Hint 2: Small words list: `SMALL_WORDS = %w[a an the and but or for nor on at to by in]`
- Hint 3: First word ALWAYS capitalises regardless of small words list
- Hint 4: `words.each_with_index.map { |word, i| ... }` lets you check if index == 0

### Exercise 4 — Run-Length Encoding
- Hint 1: You need to group consecutive identical characters. `chars` gives you an array of characters.
- Hint 2: Try building up runs: track current character and current count
- Hint 3: For decode: scan for optional digits followed by a letter. `str.scan(/(\d*)([a-z])/i)`
- Hint 4: `"3".to_i` = 3, but `"".to_i` = 0, and `[0, 1].max` = 1 — useful for the "1 means no prefix" rule

### Exercise 5 — Valid Matter Reference
- Hint 1: Split on "-" first. You should get exactly 3 parts.
- Hint 2: Part 1: 2 chars, both uppercase letters. `part.match?(/\A[A-Z]{2}\z/)`
- Hint 3: Part 2: 4 digits. Part 3: 3 digits.
- Hint 4: Handle nil input with a guard clause at the top: `return false if ref.nil?`

---

## Topic 5 — Recursion & Algorithms

### Exercise 1 — Fibonacci
- Hint 1: Base cases: fib(0) = 0, fib(1) = 1. Everything else = fib(n-1) + fib(n-2).
- Hint 2: Iterative version: start with a=[0,1], build up with a << a[-1] + a[-2], repeat n times
- Hint 3: When to use recursive vs iterative? Recursive is cleaner to read, but slow for large n.
  Iterative is O(n). Memoization makes recursive O(n) too. Say this in the interview.

### Exercise 2 — Flatten
- Hint 1: Ask for each element: is it an Array? If yes, recurse into it. If no, add it to results.
- Hint 2: `each_with_object([]) { |item, result| ... }` works well here
- Hint 3: `item.is_a?(Array)` checks if something is an array

### Exercise 3 — Binary Search
- Hint 1: Find the midpoint: `mid = (low + high) / 2`
- Hint 2: If `arr[mid] == target`, return mid. If target < arr[mid], search left half. Otherwise right.
- Hint 3: Base case: when low > high, target isn't in the array — return -1
- Hint 4: `high ||= arr.length - 1` sets high on the first call only

### Exercise 4 — Deep Count
- Hint 1: Same pattern as flatten. For each element — is it an Array? If yes, recurse. If no, count it.
- Hint 2: `reduce(0)` works well: `arr.reduce(0) { |count, item| count + ... }`

### Exercise 5 — Most Frequent
- Hint 1: Build a frequency hash first (same as Topic 1, Exercise 1)
- Hint 2: Then find the key with the maximum value
- Hint 3: `hash.max_by { |k, v| v }` returns the [key, value] pair with highest value — you want `[0]`
- Hint 4: For the tie-breaking rule (first occurrence wins), make sure your iteration order is preserved —
  Ruby hashes preserve insertion order since Ruby 1.9

---

## Topic 6 — Mock Interview

### Problem 1 — Billing Summary
- Hint 1: Break it into parts. Get total_hours first (sum of all :hours). Then total_amount.
- Hint 2: by_lawyer is a hash of name => total billed. Use `each_with_object(Hash.new(0))`.
- Hint 3: top_biller = find the key in by_lawyer with the highest value. `max_by` is your friend.
- Hint 4: Handle empty array — what should each field be? Test this case first.

### Problem 2 — ClientPortal
- Hint 1: Store clients as a hash: `@clients = {}` where key = name, value = array of matters
- Hint 2: `add_client`: check if key exists first. If yes, return the error string.
- Hint 3: `add_matter`: check if client exists first. Then push to their matters array.
- Hint 4: `all_clients`: `@clients.keys.sort`
- Hint 5: `summary`: `"#{@clients.length} clients, #{total_matters} matters total"`

### Problem 3 — DocumentSearch
- Hint 1: Store documents as a hash: `@docs = {}` where key = id, value = content string
- Hint 2: `search`: iterate over all documents, check if content includes query (case-insensitive)
- Hint 3: `content.downcase.include?(query.downcase)` handles case-insensitivity
- Hint 4: `delete`: check if id exists, return error string if not, otherwise `@docs.delete(id)`
- Hint 5: BONUS answer: for 10M documents you'd use a proper search index (Elasticsearch),
  not a full scan — O(n) search on 10M records would be too slow
