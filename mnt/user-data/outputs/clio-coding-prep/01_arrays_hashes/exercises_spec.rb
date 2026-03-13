# Topic 1 — Arrays & Hashes — RSpec Tests
# Run with: rspec 01_arrays_hashes/exercises_spec.rb

require 'date'
require_relative 'exercises'

RSpec.describe "#frequency_count" do
  it "counts occurrences of each number" do
    expect(frequency_count([1, 2, 2, 3, 3, 3])).to eq({ 1 => 1, 2 => 2, 3 => 3 })
  end

  it "returns empty hash for empty array" do
    expect(frequency_count([])).to eq({})
  end

  it "handles a single element" do
    expect(frequency_count([7])).to eq({ 7 => 1 })
  end

  it "handles all identical elements" do
    expect(frequency_count([5, 5, 5])).to eq({ 5 => 3 })
  end
end

RSpec.describe "#group_by_first_letter" do
  it "groups words by their first letter" do
    result = group_by_first_letter(["apple", "avocado", "banana", "blueberry", "cherry"])
    expect(result).to eq({
      "a" => ["apple", "avocado"],
      "b" => ["banana", "blueberry"],
      "c" => ["cherry"]
    })
  end

  it "returns empty hash for empty array" do
    expect(group_by_first_letter([])).to eq({})
  end

  it "handles a single word" do
    expect(group_by_first_letter(["fig"])).to eq({ "f" => ["fig"] })
  end

  it "groups all words under one key when they share a first letter" do
    expect(group_by_first_letter(["ant", "ape", "ark"])).to eq({ "a" => ["ant", "ape", "ark"] })
  end
end

RSpec.describe "#top_n" do
  it "returns the n largest values in descending order" do
    expect(top_n([3, 1, 4, 1, 5, 9, 2, 6], 3)).to eq([9, 6, 5])
  end

  it "returns all elements when n is larger than the array" do
    expect(top_n([3, 1, 4], 5)).to eq([4, 3, 1])
  end

  it "returns a single element when n is 1" do
    expect(top_n([3, 1, 4, 1, 5], 1)).to eq([5])
  end

  it "returns empty array for empty input" do
    expect(top_n([], 3)).to eq([])
  end

  it "handles duplicate values" do
    expect(top_n([5, 5, 3, 1], 2)).to eq([5, 5])
  end
end

RSpec.describe "#invert_hash" do
  it "swaps keys and values" do
    expect(invert_hash({ "a" => 1, "b" => 2, "c" => 3 })).to eq({ 1 => "a", 2 => "b", 3 => "c" })
  end

  it "last key wins when multiple keys share the same value" do
    expect(invert_hash({ "a" => 1, "b" => 1, "c" => 2 })).to eq({ 1 => "b", 2 => "c" })
  end

  it "returns empty hash for empty input" do
    expect(invert_hash({})).to eq({})
  end

  it "handles a single key-value pair" do
    expect(invert_hash({ "x" => 42 })).to eq({ 42 => "x" })
  end
end

RSpec.describe "#dashboard_summary" do
  let(:matters) do
    [
      { title: "Smith v Jones", status: "Open",   due_date: Date.today - 5, matter_type: "Litigation" },
      { title: "Chen Lease",    status: "Open",   due_date: Date.today + 10, matter_type: "Property" },
      { title: "Ali Estate",    status: "Closed", due_date: Date.today - 2, matter_type: "Estate" },
      { title: "Park Corp",     status: "Open",   due_date: Date.today - 1, matter_type: "Litigation" },
    ]
  end

  it "returns the correct total count" do
    expect(dashboard_summary(matters)[:total]).to eq(4)
  end

  it "counts open matters" do
    expect(dashboard_summary(matters)[:open]).to eq(3)
  end

  it "counts overdue matters (past due and not closed)" do
    expect(dashboard_summary(matters)[:overdue]).to eq(2)
  end

  it "does not count closed matters as overdue even if past due" do
    all_closed = [
      { title: "Old Case", status: "Closed", due_date: Date.today - 10, matter_type: "Litigation" }
    ]
    expect(dashboard_summary(all_closed)[:overdue]).to eq(0)
  end

  it "groups matters by type" do
    expect(dashboard_summary(matters)[:by_type]).to eq({
      "Litigation" => 2,
      "Property"   => 1,
      "Estate"     => 1
    })
  end

  it "returns zero counts for empty input" do
    result = dashboard_summary([])
    expect(result[:total]).to eq(0)
    expect(result[:open]).to eq(0)
    expect(result[:overdue]).to eq(0)
    expect(result[:by_type]).to eq({})
  end
end
