# Topic 5 — Recursion & Algorithms
# The recursion formula: BASE CASE first, then RECURSIVE CASE with smaller input.
# Always ask: what stops the recursion? what gets smaller each time?
# These are less likely in the Clio interview but good to have solid.

# ─────────────────────────────────────────────
# Exercise 1 — Fibonacci
# ─────────────────────────────────────────────
# Return the nth Fibonacci number.
# fib(0) = 0, fib(1) = 1, fib(n) = fib(n-1) + fib(n-2)
#
# fib(0)   # 0
# fib(1)   # 1
# fib(6)   # 8  (0, 1, 1, 2, 3, 5, 8)
# fib(10)  # 55
#
# Write it recursively first, then write an iterative version.
# When would you use one over the other? (Say it out loud.)

def fib_recursive(n)
  # your code here
end

def fib_iterative(n)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 2 — Flatten Array
# ─────────────────────────────────────────────
# Flatten a nested array without using .flatten
#
# flatten([1, [2, 3], [4, [5, 6]]])    # [1, 2, 3, 4, 5, 6]
# flatten([[1, [2]], [3, [4, [5]]]])   # [1, 2, 3, 4, 5]
# flatten([1, 2, 3])                   # [1, 2, 3]
# flatten([])                          # []
#
# Hint: is each element an Array? If yes, recurse. If no, add it.

def flatten(arr)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 3 — Binary Search
# ─────────────────────────────────────────────
# Given a SORTED array and a target, return the index of the target.
# Return -1 if not found.
# Do NOT use array.index or .include?
#
# binary_search([1, 3, 5, 7, 9, 11], 7)   # 3
# binary_search([1, 3, 5, 7, 9, 11], 6)   # -1
# binary_search([1], 1)                    # 0
# binary_search([], 5)                     # -1
#
# Hint: check the middle element, eliminate half the array each time.

def binary_search(arr, target, low = 0, high = nil)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 4 — Deep Count
# ─────────────────────────────────────────────
# Count the total number of integers in a deeply nested structure
# (arrays within arrays within arrays).
#
# deep_count([1, [2, 3], [4, [5, 6]]])         # 6
# deep_count([[1, [2]], [3, [4, [5]]]])         # 5
# deep_count([])                                # 0
# deep_count([1, 2, 3])                         # 3

def deep_count(arr)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 5 — Most Frequent Element
# ─────────────────────────────────────────────
# Return the element that appears most often in the array.
# If there's a tie, return the one that appears first in the array.
# Return nil for empty array.
#
# most_frequent([1, 2, 2, 3, 3, 3])    # 3
# most_frequent([1, 1, 2, 2])          # 1  (tie — first wins)
# most_frequent(["a", "b", "a"])       # "a"
# most_frequent([])                    # nil
#
# This one doesn't need recursion — use your hash skills.
# It's here to test whether you reach for the right tool.

def most_frequent(arr)
  # your code here
end
