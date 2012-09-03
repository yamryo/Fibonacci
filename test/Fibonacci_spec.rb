#
# Fibonacci_spec.rb
# 
# Time-stamp: <2012-09-03 20:47:18 (ryosuke)>

$LOAD_PATH.push File.expand_path(File.dirname(__FILE__) + '/../src')

require('Fibonacci')

#-----------------------------
describe Fibonacci, "initialized" do
  before(:all) do
    @init_fib = Fibonacci.new
  end

  it "should be [0,1]" do
    @init_fib.terms.should == [0,1]
  end

  it "should be of size 2" do
    @init_fib.size.should == 2
  end
end
#---

#-----------------------------
describe Fibonacci, "with arugment" do
  before(:all) do
    @myfib = Fibonacci.new
    @myarr = Array.new([0,1,1,2,3,5,8,13,21,34,55])
  end

  it "should return initial terms" do
    @myfib[0].should == 0
    @myfib[1].should == 1
  end

   it "should generate new terms if they don't exist" do
    @myarr.size.times{ |k| @myfib[k].should == @myarr[k] }
     # @myfib[2].should == @myarr[2]
     # @myfib[3].should == @myarr[3]
     # @myfib[4].should == @myarr[4]
   end

   it "should return a sequence for a given array of indices" do
     idxseq = [2,5,10]
     @myfib[idxseq].should == idxseq.map{ |k| @myarr[k]}
   end

   it "should return a sequence for a given range of indices" do
     @myfib[0..5].should == @myarr[0..5]
   end

  it "should accept single argument only" do
    @myfib[1,2].should raise_error
  end

  it "should not accept empty or nil argument" do
    @myfib[Array.new()].should raise_error
#    @myfib[].should raise_error
  end
end
#---

#-----------------------------
#--- End of File -------------
#-----------------------------
