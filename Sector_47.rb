                  ###   module ??? ###
#######################################################
def from (str)                                         ##
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
require from '/sources/modules/Core_module'
require from '/sources/modules/Basic_module'

class Sector_47
  include Core
  include Basic

  attr_accessor :arr

  def initialize (w = 10, h = 10)
    @weight = w
    @height = h
    @arr = []
    (0...@height).each do |l|
      @arr[l] = []
      (0...@weight).each do |c|
        @arr[l][c] = []
        (0...1).each do |j|
          @arr[l][c] << '0'     #<<<< Dirt class
        end
      end
    end
    (0...@height).each do |l|
      puts "#{@arr[l]}"
    end
  end

  def generation #<<<<<<<<<<<<<< ...

    water = Water.new
    water_size = Core.water_size @arr.size
    puts "#{water_size}"
    (0...water_size).each {@arr[ Random.rand(@arr.size) ][ Random.rand(@arr[1].size) ][0] = water}

    # GENER TREE

    grass = Grass.new
    for y in 0...@arr.size
      for x in 0...@arr[1].size
        if @arr[x][y][0] != water
          @arr[x][y][0] = grass
        end
      end
    end

    leon = Human.new( Random.rand(@arr.size), Random.rand(@arr[1].size),"Leon") #<<<< Weight & Height
    #| fix
    #@arr[leon.x][leon.y][1] = leon <<< BUG

    # GENER FAMEL
    # GENER ANIMAL (MALE/FAMEL) [CARNIVORES]
    # GENER ANIMAL (MALE/FAMEL) [HERBIVORES]

    leon
  end

  def walk object, step #<------------------------ !!!
=begin
      entry_point = { "x" => object.x, "y" => object.y }
      object.step
      entry_object = {"o" => @arr[object.x][object.y], "x" => object.x, "y" => object.y}#<<< BUG

      dice = Random.rand(2) #<-------------- Add Tree
      dice == 1 ? random_object = Water.new : random_object = Grass.new
      @arr[object.x][object.y] = object
      @arr[ entry_point["x"] ][ entry_point["y"] ] = random_object

      (0...step - 1).each {
        object.step
        @arr[ entry_object["x"] ][ entry_object["y"] ] = entry_object["o"]
        entry_object["x"] = object.x
        entry_object["y"] = object.y
        entry_object["o"] = @arr[ entry_object["x"] ][ entry_object["y"] ] #
        @arr[object.x][object.y] = object
      }
=end
  end

  def to_s
      (0...@arr.size).each do |y|
        (0...@arr.size).each do |x|
          print " #{@arr[x][y][0].id_char}"
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
      e.yield '|'                #|
      e.yield '/'                #|
      e.yield '-'                #|
      e.yield '\\'               #|
    end                          #|
  end                            #|
end                              #|---->>>> add Sector 47 to_s
                                 #|
1.upto(19) do |i|                #|
  printf("\r%s", spinner.next)   #|
  sleep(0.3)              #|
  printf ">DONE"                 #|
end                              #|
#--------------------------------#|
 puts " "

tst = Sector_47.new 4, 4
tst.generation
puts tst