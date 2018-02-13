#################################
##                             ##
##             WATCH <-        ##
##             NEEDS           ##
##             SEACH           ##
##         PROLIGERATION       ##
##         SAVE SYSTEM         ##
##            CODING           ##
##             UNQ             ##
##                             ##
#################################


class Human
  attr_accessor :x, :y, :id_char, :gender, :name

  def initialize (x, y, name, gender = 'X')
    @x  = x
    @y  = y
    @name = name
    @hp = 100
    @id_char = 'H'
    @gender  = gender
  end

  def walk step #<------- In main class
    rnd = Random.new
    for i in 1..step
      symbol = rnd.rand 2
      if symbol == 1
        dice = rnd.rand 2
        dice == 1 ? @x += 1 : @y += 1
      else
        dice = rnd.rand 2
        dice == 1 ? @x -= 1 : @y -= 1
      end

      puts "#{@id_number} NAME-> #{@name} GENDER-> #{@gender}\n LOCALE-> X-> #{@x} | Y-> #{@y}"
    end
  end

  def watch

  end

  def isDead?
    @hp == 0 ? true : false
  end

  Human < self

end