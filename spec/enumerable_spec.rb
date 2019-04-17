# require 'rspec/autorun'
require_relative "../enumerable.rb"

describe Enumerable do
  let(:arr) { [2, 4, 5] }

  context "#my_inject" do
    it "correctly sum up the elements" do
      sum = arr.my_inject(0) {|s, e| s + e}

      expect(sum).to eq(11)
    end

    it "returns nil if no block" do
      res = arr.my_inject(0)

      expect(res).to be_nil
    end

    it "evaluate the block with no initial value" do
      sum = arr.my_inject() {|s, e| s + e}

      expect(sum).to eq(11)
    end

    it "multiply_els working fine" do
      product = multiply_els(arr)

      expect(product).to eq(40)
    end
  end
end