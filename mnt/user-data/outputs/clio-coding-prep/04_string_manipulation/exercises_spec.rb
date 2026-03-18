require 'rspec'
require_relative 'exercises'

describe "#valid_matter_ref?" do
  context "when input passed is valid" do
    it "returns true" do
      expect(valid_matter_ref?("AB-2024-001")).to be true
    end
  end

  context "when input passed is nil" do
    it "returns false without error" do
      expect(valid_matter_ref?(nil)).to be false
    end
  end

  context "when there is the wrong number of parts between dashes" do
    it "returns false with too few parts" do
      expect(valid_matter_ref?("AB-2024")).to be false
    end
    it "returns false with too many parts" do
      expect(valid_matter_ref?("AB-2024-AB-2024")).to be false
    end
  end

  context "when the first part is not in the correct format (2 uppercase letters)" do
    it "returns false" do
      expect(valid_matter_ref?("A1-2024-001")).to be false
      expect(valid_matter_ref?("@-2024-001")).to be false
    end
  end

  context "when the second part is not in the correct format (4 digits)" do
    it "returns false" do
      expect(valid_matter_ref?("AB-202-001")).to be false
      expect(valid_matter_ref?("AB-AED#-001")).to be false
    end
  end

  context "when the third part is not in the correct format (3 digits)" do
    it "returns false" do
      expect(valid_matter_ref?("AB-2024-01")).to be false
      expect(valid_matter_ref?("AB-2024-0B1")).to be false
    end
  end
end

describe "#caesar" do
  context "when a string is passed in, and a number of positions to shift" do
    it "correctly shifts that number of positions" do
      expect(caesar("hello", 3)).to eq("khoor")
    end
  end

  context "when a string is passed in, the case is preserved" do
    it "correctly returns a string with correct casing and the letters rotated" do
      expect(caesar("HeLlo", 3)).to eq("KhOor")
    end
  end

  context "when a string is passed in, non-letter characters remain unchanged" do
    it "does not modify non-letter characters" do
     expect(caesar("hello!", 3)).to eq("khoor!")
    end
  end

  context "when a value of zero is passed in as the second argument" do
    it "does not change the string" do
      expect(caesar("hello", 0)).to eq("hello")
    end
  end
end