# Topic 4 — String Manipulation
# Core methods: split, chars, reverse, include?, downcase, upcase, strip,
#               gsub, count, start_with?, end_with?, tr
# These come up constantly in coding interviews — know them cold.

# ─────────────────────────────────────────────
# Exercise 1 — Palindrome Checker
# ─────────────────────────────────────────────
# Return true if a string reads the same forwards and backwards.
# Ignore case and spaces.
#
# palindrome?("racecar")          # true
# palindrome?("A man a plan a canal Panama")  # true
# palindrome?("hello")            # false
# palindrome?("")                 # true

def palindrome?(str)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 2 — Caesar Cipher
# ─────────────────────────────────────────────
# Shift each letter in the string by n positions in the alphabet.
# Wrap around: z shifted by 1 = a
# Preserve case. Leave non-letter characters unchanged.
#
# caesar("hello", 3)   # "khoor"
# caesar("xyz", 2)     # "zab"
# caesar("Hello!", 1)  # "Ifmmp!"
# caesar("abc", 0)     # "abc"

def caesar(str, n)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 3 — Title Case
# ─────────────────────────────────────────────
# Convert a string to title case.
# Every word starts with a capital letter, rest lowercase.
# But these "small words" stay lowercase UNLESS they're the first word:
# "a", "an", "the", "and", "but", "or", "for", "nor", "on", "at", "to", "by", "in"
#
# title_case("the quick brown fox")
# => "The Quick Brown Fox"  (wait — "the" first word should capitalise)
#
# title_case("war and peace")
# => "War and Peace"
#
# title_case("the lord of the rings")
# => "The Lord of the Rings"
#
# title_case("")
# => ""

def title_case(str)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 4 — Run-Length Encoding
# ─────────────────────────────────────────────
# Compress a string using run-length encoding.
# Consecutive repeated characters become count + character.
# Single characters are not prefixed with 1.
#
# encode("aaabbc")      # "3a2bc"
# encode("aabbaaa")     # "2a2b3a"
# encode("abcd")        # "abcd"  (no repeats)
# encode("")            # ""
#
# BONUS: write decode too
# decode("3a2bc")       # "aaabbc"

def encode(str)
  # your code here
end

def decode(str)
  # your code here
end

# ─────────────────────────────────────────────
# Exercise 5 — Valid Matter Reference
# ─────────────────────────────────────────────
# Clio-flavoured.
# Law firm matter references follow this format: XX-YYYY-NNN
#   XX   = 2 uppercase letters (firm code)
#   YYYY = 4 digits (year)
#   NNN  = 3 digits (sequence number)
#
# Write a method that validates a matter reference string.
#
# valid_matter_ref?("AB-2024-001")   # true
# valid_matter_ref?("AB-2024-01")    # false (sequence needs 3 digits)
# valid_matter_ref?("ab-2024-001")   # false (must be uppercase)
# valid_matter_ref?("ABC-2024-001")  # false (firm code must be 2 letters)
# valid_matter_ref?("AB-24-001")     # false (year must be 4 digits)
# valid_matter_ref?("")              # false
# valid_matter_ref?(nil)             # false
#
# Hint: consider using a regex OR split + validate each part

def valid_matter_ref?(ref)
  # your code here
end
