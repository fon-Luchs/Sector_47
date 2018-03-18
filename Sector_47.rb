require_relative "./sources/Animal"
require_relative "./sources/Grass"
require_relative "./sources/Human"
require_relative "./sources/Tree"
require_relative "./sources/Water"
require_relative "./sources/Dirt"
require_relative "./sources/Empty"

require_relative "./sources/modules/Basic_module"
require_relative "./sources/modules/Core_module"

class Sector_47
  include Basic
  include Core

  attr_accessor :human, :animal # <- change entry class Carnivorous < Animal

  def initialize (width:, length:)
    @_w     = width
    @_l     = length
    @_arr   = []
    @human  = Human.new(x: Random.rand(@_w), y: Random.rand(@_l), name: "CR-1")    # <-change entry coordinate
    @grass  = Grass.new(x: Random.rand(@_w), y: Random.rand(@_l))                  # <-
    @water  = Water.new                                                            # @_arr[x][y] = Water.new
    @animal = Animal.new(x: Random.rand(@_w), y: Random.rand(@_l), name: "Molder") # <- <-change entry class Carnivorous < Animal
    @tree   = Tree.new(x: Random.rand(@_w), y: Random.rand(@_l))                   # <-

    dirt  = Dirt.new
    empty = Empty_Space.new

    (0...@_l).each do |l|
      @_arr[l] = []
      (0...@_w).each do |c|
        @_arr[l][c] = []
        (0...1).each {
          @_arr[l][c] << dirt
        }
        (1...2).each {
          @_arr[l][c] << empty
        }
      end

    end

    spawn @water
    spawn @tree
    spawn @grass
    spawn @human
    spawn @animal

  end

  def spawn (object) # << private method | optimize
    if object.id_char == 'W'
      sp_water object
    elsif object.id_char == 'G' || object.id_char == 'T'
      sp_plants object
    elsif object.id_char == 'H' || object.id_char == 'A'
      sp_critters object
    end
  end

  def sp_critters (object)
    while 1
      if @_arr[object._x][object._y][0].through? === true
        @_arr[object._x][object._y][1] = object
        break
      end
      object.change_coord (Random.rand(@_w)), Random.rand(@_l)
    end
  end

  def sp_plants (object)
    while 1
      if @_arr[object._x][object._y][0].id_char === '0'
        @_arr[object._x][object._y][0] = object
        break
      end
      object.change_coord (Random.rand(@_w)), Random.rand(@_l)
    end
  end

  def sp_water (object)
    (0...Core.water_size(@_w)).each do
      while 1
        x = Random.rand(@_w)
        y = Random.rand(@_l)
        if @_arr[x][y][0].id_char === '0'
          @_arr[x][y][0] = object
          Basic.water_chunks_init
          break
        end
      end
    end
  end

  def step (object)
    symbol = Random.rand(2)
    dice   = Random.rand(2)

    if symbol == 0
      dice == 0 ? object._x += 1 : object._y += 1
      object._x >= @_arr.size ? object._x = (@_arr.size - 2) : object._x
      object._y >= @_arr.size ? object._y = (@_arr.size - 2) : object._y

    elsif symbol == 1
      dice == 0 ? object._x -= 1 : object._y -= 1
      object._x < 0 ? object._x = 1 : object._x
      object._y < 0 ? object._y = 1 : object._y
    end
  end

  def walk (object) # << add logic
      coord  = {x: object._x, y: object._y}
      step object
      while 1
        if @_arr[object._x][object._y][0].through?
          @_arr[coord[:x]][coord[:y]][1],
          @_arr[object._x][object._y][1] = @_arr[object._x][object._y][1],
          @_arr[coord[:x]][coord[:y]][1]
          break
        end
        step object
      end
  end

  def live (time)      # <<< Add Time
    time.times {
      puts "---------"
      walk @human
      walk @animal
      to_s
    }
  end

  def test

  end

  def to_s

    (0...@_arr.size).each do |y|
        (0...@_arr[1].size).each do |x|

          if @_arr[x][y][1].id_char === 'H' || @_arr[x][y][1].id_char === 'A'
            print " #{@_arr[x][y][1].id_char}"
            next
          end

          print " #{@_arr[x][y][0].id_char}"
        end

      puts ""
    end
    #Basic.info
  end

end

