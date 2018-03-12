require_relative "modules/Basic_module"

class Human
  include Basic
  attr_accessor :id_char, :_x, :_y, :_name

  def initialize (x: 0, y: 0, name: "Leon")
    Basic.population_init
    @id_char = 'H'.freeze
    @_x = x
    @_y = y
    @_name = name
  end

  def through?
    false
  end
end