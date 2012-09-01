
require("Fibonacci")

#-----------------------------
class FiboWithRatio < Fibonacci
  def initialize
    @terms = [1,1]
    @ratios = [0.0,1.0]
    @length = 2
  end

  def set_terms len
    @length = len
    (@length-2).times do # while (@terms[0].length < @length)
      a,b = @terms[-2],@terms[-1]
      @terms.push a+b
      @ratios << a.to_f/b.to_f
    end
  end

  def get_ratios(*arg)
    @ratios.pickup(*arg)
  end

  def display(*arg)
    if arg.length == 0 then 
      arg = (0..@length-1)
    end
    mystr = ''
    arg.each do |num|
      a = num.to_i
      while a < 0
        a += @length
      end
#       mystr += "(" + a.to_s.rjust(4) + ': ' 
# #      +(@terms[0][a-1].to_s.rjust(12))
#        + "| #{@terms[1][a-1]})/n"
      mystr += "(#{a.to_s.rjust(4)}: " 
      mystr += "#{@terms[a-1].to_s.rjust(12)}| "
      mystr += "#{@ratios[a-1]} )\n"
    end
    return mystr.chop
  end
end
#--- end of FiboWithRatio class ---

#-- main ----------------------------

myfibwr = FiboWithRatio.new
myfibwr.set_terms 80

myfibwr.get_terms[0..20].mdisp(',')
myfibwr.get_ratios(4,6,-1,-45).mdisp
myfibwr.get_ratios(4..45).mdisp('/')

p myfibwr.display(4,6,12,-45,-1)

### End of file ###

