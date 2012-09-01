#
# Fibonacci.rb
# 
# Time-stamp: <2012-08-29 18:51:26 (ryosuke)>

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

  def get_terms(*arg)
    rtn = []
    case arg.size
    when 0
      return nil
    when 1
      if arg[0].class.to_s == "Fixnum" then
        return get_a_term(arg) 
      else
        raise ArgumentError
      end
    else
      arg.each do |entry| 
        case entry.class.to_s
        when "Fixnum"
          rtn << get_a_term(entry)
        when "Range"
          entry = entry.to_a
        when  "Array"
        else
          raise ArgumentError
        end
        rtn << entry.map!{ |num| get_a_term(num) }
      end
    end
  end
  def get_a_term(num)
    num = num.to_i
    set_terms(num + 1)
    return @terms[num]
  end
  def [](*arg)
    return get_terms(arg)
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
