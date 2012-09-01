#
# test_Fibonacci2.rb
# 
# Time-stamp: <2012-08-27 19:26:28 (ryosuke)>

src_path = Dir.pwd + '/../src'
$:.unshift(src_path)

require('rubygems')
#require('test/unit/full')
require('test/unit')
require('./test_unit_extensions')

require('Fibonacci2')

#-----------------------------
class Fibonacci2Test < Test::Unit::TestCase
  def setup
    @fib = Fibonacci2.new
  end
#---

  must "initial terms are a couple of ones" do
    assert_equal [0,1], @fib.terms
    assert_equal 0, @fib[0]
    assert_equal 1, @fib[1]
  end

  must "the 2rd term is 2" do
    assert_equal 1, @fib[2]
  end

  must "output terms by inputting a range" do
    myfib = Array.new([0,1,1,2,3,5,8,13,21,34,55])
    assert_equal myfib, @fib.get_terms(0..10)
    assert_equal myfib[0..5] << myfib[10], @fib.get_terms(0..5,10)
    assert_equal [myfib[1],myfib[3],myfib[8]]+myfib[0..5]+[myfib[7],myfib[7],myfib[6]], @fib.get_terms([1,3,8],0..5,[7,7,6])
  end

#  must "output a term with big index" do
#    assert_equal 1, @fib.get_terms(10000)
#  end
end
#-----------------------------

#-----------------------------
#--- End of File -------------
#-----------------------------

#myfibwr = FiboWithRatio.new
#myfibwr.set_terms 80
#
#myfibwr.get_terms[0..20].mdisp(',')
#myfibwr.get_ratios(4,6,-1,-45).mdisp
#myfibwr.get_ratios(4..45).mdisp('/')
#
#p myfibwr.display(4,6,12,-45,-1)
