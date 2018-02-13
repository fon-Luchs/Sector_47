
#######################################################
def from str                                         ##
  File.expand_path(File.dirname(__FILE__) + str)     ## <----- !!! src/conf module
end                                                  ##
#######################################################
##  W, T, H                  @x | @y                 ## <----- !!! src/conf module
#######################################################
##                                                   ##
##                        WATER       <-             ##
##                         SCS                       ##
##                        TREE                       ##
##                        GRASS                      ##
##                        HUMAN                      ##
##                        TIME                       ##
##                       WEATHER                     ##
##                                                   ##
#######################################################

require from '/sources/Grass'
require from '/sources/Human'
require from '/sources/Tree'
require from '/sources/Water'

class Sector_47
  attr_accessor :arr

  @@living_entites = 0

  def initialize (w = 10, h = 10)
    @weight = w
    @height = h
    @arr = []
    (0...@height).each do |l|
      @arr[l] = []
      (0...@weight).each do |c|
        @arr[l] << '0'
      end
    end
  end

  def generation #<-------------------------!!!
    leon = Human.new 4, 4, 'Rasarax'
    @arr[leon.x][leon.y] = leon.id_number
  end

  def to_s
    puts "ZONE-> #{@weight} #{@height}\nLiving_entites->#{@@living_entites}\n"
    for i in 0...@arr.size
      puts"#{@arr[i]}"
    end
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
