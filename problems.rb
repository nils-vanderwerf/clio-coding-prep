# Topic 6 — Mock Interview Problems
#
# RULES FOR THESE:
#   - Set a 20-minute timer before you start each problem
#   - Use https://coderpad.io/sandbox (same environment as the real interview)
#   - Talk out loud the entire time — narrate every decision
#   - When the timer goes off, stop — note where you got to
#   - Write at least 2 RSpec tests for your solution
#
# These are designed to be similar in style and difficulty to the actual Clio interview.

# ─────────────────────────────────────────────
# Mock Problem 1 — Billing Summary (20 mins)
# ─────────────────────────────────────────────
# A law firm wants to generate a billing summary.
# Given an array of timesheet entries (each is a hash with :lawyer, :hours, :rate),
# return a summary hash with:
#   - :total_hours    => total hours across all entries
#   - :total_amount   => total billable amount (hours * rate)
#   - :by_lawyer      => hash of lawyer name => their total billed amount
#   - :top_biller     => name of the lawyer who billed the most
#
# entries = [
#   { lawyer: "Alice",   hours: 3.0, rate: 400 },
#   { lawyer: "Bob",     hours: 2.5, rate: 300 },
#   { lawyer: "Alice",   hours: 1.5, rate: 400 },
#   { lawyer: "Charlie", hours: 4.0, rate: 350 },
# ]
#
# billing_summary(entries)
# => {
#      total_hours: 11.0,
#      total_amount: 3550.0,
#      by_lawyer: { "Alice" => 1800.0, "Bob" => 750.0, "Charlie" => 1400.0 },
#      top_biller: "Alice"
#    }
#
# billing_summary([])
# => { total_hours: 0, total_amount: 0, by_lawyer: {}, top_biller: nil }
#
# Then write RSpec tests for it.

def billing_summary(entries)
  # your code here
end

# ─────────────────────────────────────────────
# Mock Problem 2 — Client Portal (20 mins)
# ─────────────────────────────────────────────
# Build a simple ClientPortal class that manages clients and their matters.
#
# ClientPortal should support:
#   - add_client(name)             — adds a client, returns "Client already exists" if duplicate
#   - add_matter(client, title)    — adds a matter to a client, returns "Client not found" if missing
#   - matters_for(client)          — returns array of matter titles for that client
#                                    returns [] if client has no matters
#                                    returns "Client not found" if client doesn't exist
#   - all_clients                  — returns array of all client names, alphabetically sorted
#   - summary                      — returns "X clients, Y matters total"
#
# portal = ClientPortal.new
# portal.add_client("Alice Smith")
# portal.add_client("Bob Jones")
# portal.add_client("Alice Smith")        # "Client already exists"
# portal.add_matter("Alice Smith", "Lease dispute")
# portal.add_matter("Alice Smith", "Will preparation")
# portal.add_matter("Bob Jones", "Contract review")
# portal.add_matter("Unknown", "Something")  # "Client not found"
# p portal.matters_for("Alice Smith")     # ["Lease dispute", "Will preparation"]
# p portal.all_clients                    # ["Alice Smith", "Bob Jones"]
# puts portal.summary                     # "2 clients, 3 matters total"
#
# Then write RSpec tests covering the main paths and edge cases.

class ClientPortal
  # your code here
end

# ─────────────────────────────────────────────
# Mock Problem 3 — Document Search (20 mins)
# ─────────────────────────────────────────────
# Build a DocumentSearch class that indexes and searches documents.
#
# DocumentSearch should support:
#   - index(id, content)    — stores a document with an integer id and string content
#                             overwrites if id already exists
#   - search(query)         — returns array of document ids whose content
#                             contains the query string (case-insensitive)
#                             returns [] if no matches
#   - delete(id)            — removes a document by id
#                             returns "Document not found" if id doesn't exist
#   - count                 — returns total number of indexed documents
#
# search = DocumentSearch.new
# search.index(1, "Lease agreement for Alice Smith")
# search.index(2, "Will and testament for Bob Jones")
# search.index(3, "Lease renewal notice")
# p search.search("lease")          # [1, 3]  (case-insensitive)
# p search.search("ALICE")          # [1]
# p search.search("nothing here")   # []
# search.delete(1)
# p search.search("lease")          # [3]
# puts search.count                 # 2
# puts search.delete(99)            # "Document not found"
#
# Then write RSpec tests.
# BONUS: what would you change if there were 10 million documents?
#        Say it out loud — don't code it.

class DocumentSearch
  # your code here
end
