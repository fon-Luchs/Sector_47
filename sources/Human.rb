require_relative "modules/Basic_module"
require_relative "modules/Core_module"
require_relative "Empty"

class Human
  include Basic
  include Core
  attr_accessor :id_char, :_x, :_y, :_name

  def initialize (x: 0, y: 0, name: "Leon", years: 1)
    Basic.population_init
    @id_char = 'H'.freeze
    @_x = x
    @_y = y
    @_year = years
    @_hp   = @_year * 100
    @_name = name
    @_store = []
    store_init
    show_memory
    # ObjectSpace.define_finalizer( self, self.class.finalize(id_char, _x, _y, _name, @_year) )
  end

  def change_coord (new_x, new_y)
    @_x = new_x
    @_y = new_y
  end

  def store_init
    empty = Empty_Space.new
    (0...Basic.get_l).each do |l|
      @_store[l] = []
      (0...Basic.get_w).each do |c|
        @_store[l][c] = []
        (0...1).each {
          @_store[l][c] << empty
        }
        (1...2).each {
          @_store[l][c] << empty
        }
      end

    end
    p
  end

  def show_memory
    (0...@_store.size).each do |y|
      (0...@_store[1].size).each do |x|
        print " #{@_store[x][y][0].id_char}"
      end
      puts
    end
  end

  def memory (object)
    @_store[@_y][@_x][0] = object
    puts "MEMORY LOG  #{object.id_char}"
  end

  def through?
    false
  end


  # def self.finalize(id_char, _x, _y, _name, _year)
  #
  #   proc { puts "\t DIE \n ID_CHAR>#{id_char}\n NAME   >#{_name}\n YEARS  >#{_year}\n COORDINATE>(#{_x};#{_y})" }
  # end
end