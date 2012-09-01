#
# Fibonacci_spec.rb
# 
# Time-stamp: <2012-09-01 12:05:22 (ryosuke)>

src_path = Dir.pwd + '/../src'
$:.unshift(src_path)

#require('rubygems')
#require('test/unit/full')
#require('test/unit')
#require('~/rubyP/test_unit_extensions')

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

  it "should generate new terms if they don't exist" do
#    @myarr.size.times{ |k| @myfib[k-1].should == @myarr[k-1]}
    @myfib[2].should == @myarr[2]
    @myfib[3].should == @myarr[3]
    @myfib[4].should == @myarr[5]
  end

  it "should return a sequence for a give array of indices" do
    idxseq = [2,5,10]
    @myfib[idxseq].should == idxseq.map{ |k| @myarr[k]}
  end

  it "should return a sequence for a give range of indices" do
    @myfib[0..5].should == @myarr[0..5]
  end

  it "should return nil if a wrong argument given" do
    @myfib[[]].should be_nil 
  end
end
#---

#-----------------------------
#--- End of File -------------
#-----------------------------
