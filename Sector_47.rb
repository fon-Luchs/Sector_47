                ###   module ??? ###
#######################################################
def from str                                         ##
  File.expand_path(File.dirname(__FILE__) + str)     ## <----- !!! src/conf module
end                                                  ##
#######################################################
##  W, T, H                  @x | @y                 ## <----- !!! src/conf module
#######################################################
##                                                   ##
##                        WATER       <-100%         ##
##                         SCS        <-100%         ## <----- Refactor (change push logic)
##                        TREE                       ##
##                        GRASS       <-100%         ##
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

  def generation

    water_size = Random.rand( (@arr.size * @arr[1].size) / 2 )
    water_size < 10 ? water_size += 10 : water_size
    water = Water.new
    for i in 0..water_size
      @arr[ Random.rand(@arr.size) ][ Random.rand(@arr[1].size) ] = water
    end

    grass = Grass.new
    for y in 0...@arr.size
      for x in 0...@arr[1].size
        if @arr[x][y] != water
          @arr[x][y] = grass
          @@living_entites += 1 #<<<<<<<<<<
        end
      end
    end

    leon = Human.new 4, 4, 'Rasarax'
    @arr[leon.x][leon.y] = leon
    @@living_entites += 1       #<<<<<<<<<<

  end

  def walk object, step #<------------------------ !!!
    for i in 0...step
      @arr[object.x][object.y] = '0'
      object.step
      @arr[object.x][object.y] = object.id_char
    end
  end

  def to_s
    puts "ZONE-> #{@weight} #{@height}\nLiving_entites->#{@@living_entites}\n"
    for y in 0...@arr.size
      for x in 0...@arr[1].size
        print" #{@arr[x][y].id_char} "
      end
      puts " "
    end
  end

end

#################################################################################################

#--------------------------------#|
spinner = Enumerator.new do |e|  #|
  loop do                        #|
    for i in (0...10)            #|
      e.yield '#'                #|
    end                          #|
  end                            #|
end                              #|---->>>> add Sector 47 to_s
                                 #|
1.upto(10) do |i|                #|
  printf("\r%s", spinner.next)   #|
  sleep(0.3)              #|
  printf " ->DONE \n"            #|
end                              #|
#--------------------------------#|