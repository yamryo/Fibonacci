#
# Fibonacci.rb
# 
# Time-stamp: <2012-09-01 13:32:43 (ryosuke)>

require('pry')
require('pry-nav')

#-----------------------------
class Fibonacci
  def initialize
    @terms = Array.new([0,1])
  end
  attr_reader :terms

  def add_next()
    @terms << @terms[-2]+@terms[-1]
  end

#  def set_terms len
#    if len > 2 then
#      (len-2).times{ @terms << @terms[-2]+@terms[-1] }
#    end
#  end

  def set_terms(len)
    add_next while @terms.size < len
    return self
  end

  def [](*arg)
    return get_terms(arg[0])
  end
  def get_terms(*arg)
    raise ArgumentError, "Wrong arguments!!" if arg.nil? or arg.size > 1
    arg = arg[0]
    case arg.class.name
    when 'Fixnum'
#      binding.pry if arg == 2
      rtn = get_a_term(arg)
    when 'Range', 'Array'
      rtn = (arg.to_a).map{ |num| get_a_term(num) }
    else
      raise ArgumentError
    end
    return rtn
  end
  def get_a_term(num)
    num = num.to_i
    set_terms(num + 1)
    return @terms[num]
  end

  def length()
    @terms.length
  end
  def size()
    self.length
  end
  
  def ratio(num)
    num = num.to_i
    set_terms(num + 1)
    return @terms[num].to_f/@terms[num + 1].to_f
  end

end
#--- end of Fibonacci class ---

#----------------------------------
class Array
  def pickup(*arg)
    if arg.length == 0 then 
      return self
    else
      if arg[0].class.to_s == "Range" then
        arg = arg[0].to_a
      end
      myArr = []
      arg.each{ |num| myArr << self[num.to_i] }
      return myArr
    end
  end

  def mdisp(*arg)
    spliter = if (arg.length == 0) then ',' else arg[0] end
    mystr = ''
    self.each{ |term| mystr += term.to_s + spliter }
    puts mystr.chop
  end
end
#--- end of extension of Array class ---

#-----------------#
### End of File ###
#-----------------#
