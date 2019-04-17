# require 'rspec/autorun'
require_relative "../enumerable.rb"

describe Enumerable do
  let(:arr) { [2, 4, 5] }

  context "#my_any" do
    it "returns true if no block given" do
      r = arr.my_any

      expect(r).to eq(true)
    end

    it "returns false if an empty block given" do
      r = arr.my_any {}

      expect(r).to eq(false)
    end

    it "returns true at least one element satisfy the block condition" do
      r = arr.my_any{|x| x%2 == 0}

      expect(r).to eq(true)
    end

    it "returns false if none elements satisfy the block condition" do
      r = arr.my_any{|x| x > 6}

      expect(r).to eq(false)
    end
  end

  context "#my_none" do
    it "returns true if no block give" do
      r = arr.my_none

      expect(r).to eq(true)
    end

    it "returns true if the array is empty" do
      r = [].my_none

      expect(r).to eq(true)
    end

    it "returns false if at least one element satisfie the block condition" do
      r = arr.my_none{|x| x%2 == 0}

      expect(r).to eq(false)
    end
  end

  context "#my_count" do
    let(:arr) { [2, 4, 5, 2, 0, 5, 5, 3] }

    it "returns the size when no block given" do
      c = arr.my_count

      expect(c).to eq(8)
    end

    it "counts the number of element equal to the parameter given when no block given" do
      c = arr.my_count(2)

      expect(c).to eq(2)
    end

    it "returns the number of element corresponding to the block evalution" do
      c = arr.my_count {|x| x%2 == 0}

      expect(c).to eq(4)
    end
  end

  context "#my_map" do
    it "runs the block for every element" do
      new_arr = arr.my_map{|i| i * 2}

      expect(new_arr).to eq([4, 8, 10])
    end

    it "returns nil if the block is empty" do
      new_arr = arr.my_map {}

      expect(new_arr).to eq([nil, nil, nil])
    end
  end

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
