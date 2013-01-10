#
# Specifying BlockChanges module capabilities
# Author: Kannan Manickam <arangamani.kannan@gmail.com>
#

require File.expand_path('../spec_helper', __FILE__)

class DummyClass
end

describe BlockChanges do
  context "Given that there are no changes in a block" do
    before(:all) do
      @dummy = DummyClass.new
      @dummy.extend(BlockChanges)
    end

    it "Should be able to detect there are no changes in a simple block" do
      some_var = 10
      @dummy.detect_changes('some_var') do
        some_var += 0
      end
      @dummy.changes_detected?.should == false
      @dummy.get_changes.should == 0
    end

    it "Should be able to detect there are no changes in a complex block including arrays and hashes" do
      some_var = 5
      some_hash = { :var => 5 }
      some_array = [4, 5, 'str']
      @dummy.detect_changes('some_var', 'some_hash', 'some_array') do
        some_var += 0
        some_array[0] += 0
      end
      @dummy.changes_detected?.should == false
      @dummy.get_changes.should == 0
    end
  end

  context "Given that there are changes in a block" do
    before(:all) do
      @dummy = DummyClass.new
      @dummy.extend(BlockChanges)
    end

    it "Should be able to detect changes in a simple block" do
      some_var = 10
      @dummy.detect_changes('some_var') do
        some_var += 1
      end
      @dummy.changes_detected?.should == true
      @dummy.get_changes.should == 1
    end

    it "Should be able to detect changes in a complex block including arrays and hashes" do
      some_var = 5
      some_hash = { :var => 5 }
      some_array = [4, 5, 'str']
      @dummy.detect_changes('some_var', 'some_hash', 'some_array') do
        some_var = 6
        some_hash[:var] = 6
        some_array[0] += 1
      end
      @dummy.changes_detected?.should == true
      @dummy.get_changes.should == 3
    end

    it "Should be able to get correct number of changed variables in a complex block including arrays and hashes" do
      some_var = 5
      some_hash = { :var => 5 }
      some_array = [4, 5, 'str']
      @dummy.detect_changes('some_var', 'some_hash', 'some_array') do
        some_var = 6
        some_array[0] += 1
      end
      @dummy.changes_detected?.should == true
      @dummy.get_changes.should == 2
    end
  end
end
