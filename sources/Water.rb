##################
## River? Lake? ##
## Water % lim  ##
##         n->∞ ##
##################

class Water
  def initialize (h, w)
    rnd = Random.new

    @x = rnd.rand h
    @y = rnd.rand w
    @height = rnd.rand h / 8
    @weight = rnd.rand w / 8
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