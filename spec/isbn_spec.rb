require 'minitest/spec'
require 'minitest/autorun'
require "isbn"

describe "Isbn" do
  describe "#check_digit" do
    it "returns proper value" do
      isbn = Isbn.new(prefix12: "978014300723")
      _(isbn.check_digit).must_equal 4

      isbn = Isbn.new(prefix12: "978014300724")
      _(isbn.check_digit).must_equal 1

      isbn = Isbn.new(prefix12: "978014300734")
      _(isbn.check_digit).must_equal 0
    end
  end

  describe ".initialize" do
    describe "when isbn12 is wrong" do
      it "raises the exception" do
        _{ Isbn.new(prefix12: "1234567890") }.must_raise ArgumentError
      end
    end
  end
end
