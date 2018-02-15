##################
## River? Lake? ##
## Water % lim  ##
##         n->∞ ##
##################

class Water
  def initialize (x, y)
    @x = x
    @y = y
=begin
    rnd = Random.new
    symbol = rnd.rand 2
    if symbol == 1
      dice = rnd.rand 2
      dice == 1 ? @x += 1 : @y += 1
    else
      dice = rnd.rand 2
      dice == 1 ? @x -= 1 : @y -= 1
=end
    ###############
    ##  RAND!!!<-##
    ##   SIZE  <-##????
    ## CORDINATE ##
    ##   COUNT   ##
    ##   STATE   ##
    ##   PROPS   ##
    ###############

  end

  def to_s
    puts "W x-> #{@x} | y-> #{@y} | w-> #{@weight} | h-> #{@height}"
  end
end