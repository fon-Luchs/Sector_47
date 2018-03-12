require_relative "modules/Basic_module"

class Tree
  include Basic
  attr_accessor :id_char, :_x, :_y

  def initialize (x: 0, y: 0)
    Basic.population_init
    @id_char = 'T'.freeze
    @_x = x
    @_y = y
    @_state = 1
  end

  def through?
    false
  end

  def to_s

  end
end