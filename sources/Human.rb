require_relative "modules/Basic_module"

class Human
  include Basic
  attr_accessor :id_char, :_x, :_y, :_name

  def initialize (x: 0, y: 0, name: "Leon", years: 1)
    Basic.population_init
    @id_char = 'H'.freeze
    @_x = x
    @_y = y
    @_year = years
    @_hp   = @_year * 100
    @_name = name
  end

  def change_coord (new_x, new_y)
    @_x = new_x
    @_y = new_y
  end

  def through?
    false
  end
end