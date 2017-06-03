# Test node class

require_relative 'minitest_helper'

describe Node do
  describe " class tests " do
    it "tests new Objtype is of class type Node" do
      Node.new('aRoot', 5).must_be_kind_of Node
    end

    it "tests if @name is String given correct arg0" do
      Node.new('aRoot', 5).name.must_be_kind_of String
    end

    it "tests if @weight is Integer given correct arg1" do
      Node.new('aRoot', 5).weight.must_be_kind_of Integer
    end

    it "raises ArgumentError if arg0 is not String" do
      assert_raises ArgumentError do
        Node.new(5,'aRoot')
      end
    end

    it "@weight is Integer" do
      assert_raises ArgumentError do
        Node.new('aRoot','foo')
      end
    end
  end
end
