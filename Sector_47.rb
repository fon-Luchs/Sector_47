
#######################################################
def from str                                         ##
  File.expand_path(File.dirname(__FILE__) + str)     ## <----- !!! src/ module
end                                                  ##
#######################################################
##  W, T, H                  @x | @y                 ## <----- !!! src/ module
#######################################################

require from '/sources/Grass'
require from '/sources/Human'
require from '/sources/Tree'
require from '/sources/Water'

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

    plant = Grass.new tst_x.rand(@weight), tst_y.rand(@height)
    nikolas = Human.new tst_x.rand(@weight), tst_y.rand(@height)
    nikolas.walk 5

    puts "P X-> #{plant.x} | Y-> #{plant.y}"
  end

  def to_s
    puts "ZONE-> #{@weight} #{@height}\nLiving_entites->#{@@living_entites}\n"
  end

end
#################################################################################################

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
