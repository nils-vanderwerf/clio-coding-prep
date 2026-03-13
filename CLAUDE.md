# CLAUDE.md — Core Patterns Reference Card

Read this before every practice session. These are the patterns that appear in almost every problem.

---

## The Hash Pattern — memorise this

```ruby
# Every hash problem reduces to two questions:
# 1. What is the key?
# 2. What is the value?

result = {}
array.each do |item|
  result[key] = value
end
result
```

---

## The Big 5 Array Methods

```ruby
# map — transform every element, returns same count
[1, 2, 3].map { |n| n * 2 }           # [2, 4, 6]

# select — filter, keep matching elements
[1, 2, 3, 4].select { |n| n.even? }   # [2, 4]

# reject — opposite of select
[1, 2, 3, 4].reject { |n| n.even? }   # [1, 3]

# reduce — collapse to single value, MUST return accumulator
[1, 2, 3, 4].reduce(0) { |sum, n| sum + n }  # 10

# each_with_object — build up an object, accumulator carried automatically
[1, 2, 3].each_with_object([]) { |n, arr| arr << n * 2 }  # [2, 4, 6]
```

---

## Counting Pattern

```ruby
# Hash.new(0) — missing keys default to 0, not nil
words.each_with_object(Hash.new(0)) do |word, counts|
  counts[word] += 1
end
```

---

## Index Pattern

```ruby
# Need original index? Use each_with_index BEFORE filtering
array.each_with_index do |item, index|
  result[index] = item if condition
end

# WARNING: selecting first loses original indexes
array.select { ... }.each_with_index  # indexes start from 0 again — wrong!
```

---

## Chaining Pattern

```ruby
# Filter then transform — select comes before map
array.select { |x| condition }.map { |x| transform }

# Common mistake: map then select (transforms things you're about to throw away)
```

---

## Class Pattern

```ruby
class Thing
  attr_reader :name      # read only
  attr_writer :name      # write only
  attr_accessor :name    # read and write

  def initialize(name, value = 0)
    @name = name
    @value = value
  end

  def do_something
    # instance methods use @variables
  end

  def to_s
    "Thing: #{@name}"  # called when you puts an object
  end
end
```

---

## Validation Pattern

```ruby
def withdraw(amount)
  return "insufficient funds" if amount > @balance
  @balance -= amount
end
```

---

## RSpec Pattern

```ruby
RSpec.describe ClassName do
  # let is lazy — only runs when called
  let(:subject) { ClassName.new }

  describe "#method_name" do
    context "when condition is true" do
      it "does the expected thing" do
        expect(subject.method).to eq(expected_value)
      end
    end

    context "when condition is false" do
      it "handles it gracefully" do
        expect(subject.method).to eq(other_value)
      end
    end
  end
end
```

---

## Common RSpec Matchers

```ruby
expect(x).to eq(5)           # equality
expect(x).to be > 3          # comparison
expect(x).to be_nil          # nil check
expect(x).to be_empty        # empty array/string/hash
expect(x).to include("foo")  # inclusion
expect(x).to be_a(String)    # type check
expect { code }.to raise_error(ErrorType)  # exceptions
expect { code }.to change { obj.value }.by(1)  # change
```

---

## String Methods

```ruby
"hello world".split          # ["hello", "world"] — splits on whitespace
"hello".chars                # ["h", "e", "l", "l", "o"]
"hello".reverse              # "olleh"
"hello".include?("ell")      # true
"Hello".downcase             # "hello"
"hello".upcase               # "HELLO"
"  hello  ".strip            # "hello"
"hello world".gsub("o", "0") # "hell0 w0rld"
"aeiou".include?(word[0])    # check if first char is a vowel
```

---

## Recursion Pattern

```ruby
def recursive_method(input)
  # 1. BASE CASE FIRST — what stops the recursion?
  return base_value if input == base_condition

  # 2. RECURSIVE CASE — call self with smaller input
  recursive_method(smaller_input)
end
```

---

## Useful Ruby Shortcuts

```ruby
# Shorthand blocks
array.map(&:upcase)          # same as map { |x| x.upcase }
array.select(&:even?)        # same as select { |x| x.even? }

# Multiple assignment
first, *rest = [1, 2, 3, 4]  # first=1, rest=[2,3,4]

# Safe navigation (avoid nil errors)
user&.name                   # returns nil instead of NoMethodError

# Ternary
x > 0 ? "positive" : "negative"

# Default parameter
def greet(name = "stranger")

# p vs puts
p object        # calls .inspect — shows full structure, great for debugging
puts object     # calls .to_s — human readable
```

---

## Before You Type — The Checklist

1. Restate the problem out loud in your own words
2. Ask about edge cases: empty input? nil? negative numbers? duplicates?
3. Say your approach before writing a single line
4. Write the method signature first
5. Get it working, then say "this works — I'd refactor X in production"
