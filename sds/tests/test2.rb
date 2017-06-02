# Test controller class

require_relative 'minitest_helper'

describe Controller do
  original_stderr = $stderr
  original_stdout = $stdout

  before :all do
   $stderr = File.new(File.join(__dir__, 'test-stderr.log'), 'w')
   $stdout = File.new(File.join(__dir__, 'test-stdout.log'), 'w')
  end

  after :all do
   $stderr = original_stderr
   $stdout = original_stdout
  end

  describe " class tests" do
    root_weight = 5
    node       = Node.new('aRoot', root_weight)
    controller = Controller.new(node)

    it "raises ArgumentError if arg0 is not type Node" do
      assert_raises ArgumentError do
        Controller.new('node')
      end
    end

    it "tests Controller creation with valid Node class arg" do
      Controller.new(node).must_be_kind_of Controller
    end

    it "tests new controller obj @keys has only 1 element" do
      Controller.new(node).keys.count.must_equal 1
    end

    it "tests new controller obj @names has only 1 element" do
      Controller.new(node).names.count.must_equal 1
    end

    it "tests new controller obj @names 0th element is == node.name" do
      Controller.new(node).names.first.must_equal node.name
    end

    it "tests new controller obj @keys 0th element is == node.weight" do
      Controller.new(node).keys.first.must_equal node.weight
    end

    it "tests insert fails on dupe name" do
      Controller.new(node).insert('aRoot', 1).must_equal false
    end

    it "tests insert fails on dupe weight" do
      Controller.new(node).insert('zNode', root_weight).must_equal false
    end

    it "validates output to 'true' for valid insert use-case" do
      proc{Controller.new(node).insert('aNode', 1)}.must_output /true\n/
    end

    it "validates output to 'false' for invalid (dupe name) insert" do
      proc{Controller.new(node).insert('aRoot', 1)}.must_output /false\n/
    end

    it "validates output to 'false' for invalid (dupe weight) insert'" do
      proc{Controller.new(node).insert('zNode', root_weight)}.must_output /false\n/
    end

# Now getting into the nitty gritty
# From here, The last few tests are 
# meant to validate that the insert
# works properly and that the print
# method does what it's supposed to
# Will do the print method first as
# I thnk it will be the easiest to
# write of the rest.
    controller     = Controller.new(node)

    # I can't put duplicate keys in a hash
    # so I'll run two inserts to get every 
    # possible test case run.

    # Note that if you change this data structure
    # then you will be affecting some tests below.
    good_apples    = {
                       'aRoot' => root_weight,
                       '1hopl' => 4,
                       '1hopr' => 6,
                       'aNode' => 1,
                       'fNode' => 15,
                       'zNode' => 99,
                     }
    bad_apples     = {
                       'bNode' => 5,
                       'aNode' => 6,
                     }
    all_valid      = {}

    it "tests #printOrderedNames output is correct" do
      intermediate   = {}

      muxed_keys = (good_apples.keys + bad_apples.keys).uniq
      muxed_keys.each\
      {|k| 
        if good_apples.has_key? k
          intermediate[k] = good_apples[k]
        else
          intermediate[k] = bad_apples[k]
        end
      }

      # Now that I've merged the array of keys
      # and made that array uniq, I need to go through
      # the values and do the same and
      # then create a new hash from which to validate
      intermediate.values.uniq.each\
      {|v|
        k = intermediate.key(v)
        all_valid[k] = v
      }

      # run a valid test case
      good_apples.each_pair{ |k,v| controller.insert(k,v) }
       bad_apples.each_pair{ |k,v| controller.insert(k,v) }

      # validate
      proc{controller.printOrderedNames}.must_output all_valid.keys.sort.join(' ') + "\n"
    end
  end
end
