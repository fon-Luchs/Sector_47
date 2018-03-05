#######################################################
##                                                   ##
##                 UNIQUE COORDINATES <-             ## <----- In order to avoid objects located in objects
##                                                   ##
#######################################################

class Tree
  def initialize (x, y)
    @__x = x
    @__y = y
    @id_char = 'T'
    @state = 100
  end

  def to_s
    puts "T X -> #{@__x} | Y-> #{@__y}"
  end
end