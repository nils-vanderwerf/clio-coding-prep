# Topic 1 — Arrays & Hashes
# Core methods: map, select, reject, each_with_object, each_with_index, Hash.new(0)
# Say your approach out loud before typing. Ask: what is the key? what is the value?

# ─────────────────────────────────────────────
# Exercise 1 — Frequency Counter
# ─────────────────────────────────────────────
# Return a hash where each key is a number and the value is how many
# times it appears in the array.
#
# frequency_count([1, 2, 2, 3, 3, 3])
# => {1=>1, 2=>2, 3=>3}
#
# frequency_count([])
# => {}

def frequency_count(arr)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 2 — Group By First Letter
# ─────────────────────────────────────────────
# Given an array of words, return a hash grouping words by their first letter.
# Keys are lowercase letters, values are arrays of matching words.
#
# group_by_first_letter(["apple", "avocado", "banana", "blueberry", "cherry"])
# => {"a"=>["apple", "avocado"], "b"=>["banana", "blueberry"], "c"=>["cherry"]}
#
# group_by_first_letter([])
# => {}

def group_by_first_letter(words)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 3 — Top N Values
# ─────────────────────────────────────────────
# Given an array of integers and a number n,
# return the n largest values in descending order.
#
# top_n([3, 1, 4, 1, 5, 9, 2, 6], 3)
# => [9, 6, 5]
#
# top_n([3, 1, 4], 5)
# => [4, 3, 1]  (fewer than n elements — return all)

def top_n(arr, n)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 4 — Invert Hash
# ─────────────────────────────────────────────
# Given a hash, return a new hash with keys and values swapped.
# If multiple keys have the same value, the last one wins.
#
# invert_hash({"a" => 1, "b" => 2, "c" => 3})
# => {1=>"a", 2=>"b", 3=>"c"}
#
# invert_hash({"a" => 1, "b" => 1, "c" => 2})
# => {1=>"b", 2=>"c"}  (last key wins for duplicate values)

def invert_hash(hash)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 5 — Matters Dashboard
# ─────────────────────────────────────────────
# Clio-flavoured. Given an array of matter hashes, return a summary hash with:
#   - :total        => total number of matters
#   - :open         => count of matters with status "Open"
#   - :overdue      => count of matters where due_date is in the past and status != "Closed"
#   - :by_type      => hash of matter_type => count
#
# matters = [
#   { title: "Smith v Jones", status: "Open", due_date: Date.today - 5, matter_type: "Litigation" },
#   { title: "Chen Lease",    status: "Open", due_date: Date.today + 10, matter_type: "Property" },
#   { title: "Ali Estate",    status: "Closed", due_date: Date.today - 2, matter_type: "Estate" },
#   { title: "Park Corp",     status: "Open", due_date: Date.today - 1, matter_type: "Litigation" },
# ]
#
# dashboard_summary(matters)
# => {
#      total: 4,
#      open: 3,
#      overdue: 2,
#      by_type: { "Litigation" => 2, "Property" => 1, "Estate" => 1 }
#    }

require 'date'

def dashboard_summary(matters)
  # your code here
end
