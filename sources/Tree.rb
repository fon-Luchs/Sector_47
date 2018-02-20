#######################################################
##                                                   ##
##                 UNIQUE COORDINATES <-             ## <----- In order to avoid objects located in objects
##                                                   ##
#######################################################

class Tree
  def initialize (x, y)
    @x = x
    @y = y
    @id_char = 'T'
    @state = 100
  end

  def to_s
    puts "T X -> #{@x} | Y-> #{@y}"
  end
end