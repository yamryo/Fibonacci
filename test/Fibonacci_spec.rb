#
# Fibonacci_spec.rb
# 
# Time-stamp: <2012-09-04 10:26:38 (ryosuke)>

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
  context "acceptable" do
    before :all do
      @myfib = Fibonacci.new
      @myarr = Array.new([0,1,1,2,3,5,8,13,21,34,55])
    end
#
    it "should return initial terms" do
      @myfib[0].should == 0
      @myfib[1].should == 1
    end
#
    it "should generate new terms if they don't exist" do
      @myarr.size.times{ |k| @myfib[k].should == @myarr[k] }
      # @myfib[4].should == @myarr[4]
    end
#
    it "should return a sequence for a given array of indices" do
      idxseq = [2,5,10]
      @myfib[idxseq].should == idxseq.map{ |k| @myarr[k]}
    end
#
    it "should return a sequence for a given range of indices" do
      @myfib[0..5].should == @myarr[0..5]
    end
  end
#
  context "not acceptable" do
    before(:all) do
      @myfib = Fibonacci.new
    end
#
    it "should accept single argument only" do
      @myfib[1,2].should raise_error
    end
#
    it "should not accept empty or nil argument" do
      @myfib[Array.new()].should raise_error
      # @myfib[].should raise_error
    end
  end
#
end
#---

#-----------------------------
describe Fibonacci, "#length" do
  subject { @myfib.length }
#
  context "of initial data" do
    before { @myfib = Fibonacci.new }
#
    it { should be_equal 2 }
  end
#
  context "comparing with #size" do
    before do 
      @myfib = Fibonacci.new
      @myfib[10]
    end
    it "should be the same" do
      should == @myfib.size
    end
  end
end
#---

#-----------------------------
describe Fibonacci, "#ratio" do
  context "of the intial 15 terms of the fib seq" do
    before :all do
      @myfib = Fibonacci.new
      @myarr = [0,1,1,2,3,5,8,13,21,34,55,89,55+89,55+89*2,55*2+89*3]
      @ratios, @expect = Array.new, Array.new

      (@myarr.length - 1).times do |k|
        @ratios << @myfib.ratio(k)
        @expect << @myarr[k].to_f/@myarr[k+1].to_f 
    end
  end
#
    subject{ @ratios }
    it { should == @expect}
  end
end
#---

#-----------------------------
#--- End of File -------------
#-----------------------------
