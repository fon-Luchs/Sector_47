class Human
  attr_accessor :x, :y

  def initialize (x, y)
    @x = x
    @y = y
    @hp = 100
  end

  def walk step
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

      puts "H X-> #{@x} | Y-> #{@y}"
    end
  end

  def isDead?
    @hp == 0 ? true : false
  end

  Human < self

end