require_relative "modules/Basic_module"
##################
#                #
# =PARENT_CLASS= #
#                #
##################
class Animal
  include Basic
  attr_accessor :id_char, :_y, :_y, :_name

  def initialize (x: 0, y: 0, name: "Maira")
    Basic.population_init
    @id_char = 'A'.freeze
    @_x = x
    @_y = y
    @_name = name
  end

  def through?
    false
  end

end