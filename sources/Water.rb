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
    puts "W w->#{@weight} | h->#{@height}"
  end
end