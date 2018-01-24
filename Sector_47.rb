class Dummy
  attr_accessor :x, :y

  def initialize (x, y)
    @x = x
    @y = y
  end
end

class Grass
  attr_accessor :x, :y

  def initialize (x, y)
    @x = x
    @y = y
  end
end

class Sector_47

  @@living_entites = 0

  def initialize (w = 5000, h = 5000)
    @weight = w
    @height = h
  end

  def generation
    lim_x = @weight
    lim_y = @height

    x = 0
    y = 0

    tst_x = Random.new
    tst_y = Random.new

    plant = Grass.new tst_x.rand(5), tst_y.rand(4)

    puts "X-> #{plant.x} | Y-> #{plant.y}"
  end

  def to_s
    puts "ZONE-> #{@weight} #{@height}\nLiving_entites->#{@@living_entites}\n"
  end

end

tst = Sector_47.new
tst.generation
puts tst

spinner = Enumerator.new do |e|
  loop do
    for i in (0...10)
      e.yield "#{i}"
    end
  end
end

1.upto(10) do |i|
  printf("\rProcess: %s", spinner.next)
  sleep(0.3)
  printf " ->DONE"
end
