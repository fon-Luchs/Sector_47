#######################################################
##                                                   ##
##                 UNIQUE COORDINATES <-             ## <----- In order to avoid objects located in objects
##                                                   ##
#######################################################

class Tree
  def initialize (x, y)
    @x = x
    @y = y
  end

  def to_s
    puts "T X -> #{@x} | Y-> #{@y}"
  end
end