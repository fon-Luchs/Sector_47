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

  def initialize (width:, length:)
    @_w = width
    @_l = length
    @arr = []

    dirt = Dirt.new
    empty = Empty_Space.new

    (0...@_l).each do |l|
      @arr[l] = []
      (0...@_w).each do |c|
        @arr[l][c] = []
        (0...1).each {
          @arr[l][c] << dirt
        }
        (1..2).each {
          @arr[l][c] << empty
        }
      end
    end
  end

  def to_s
    (0...@arr.size).each do |y|
        (0...@arr[1].size).each do |x|
          print " #{@arr[x][y][0].id_char}"
        end
      puts " "
    end
    puts ">>#{@arr[1][1][1].id_char}"
  end

end

