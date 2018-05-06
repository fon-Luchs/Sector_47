require_relative "Nature"
require_relative "Earth_Module"

class Grass < Nature
  include Earth_Module
  def initialize(x_cord, y_cord)
    super
    self.id_char = 'G'
    add_grass self
  end

  def reproduction
    super
    nature_migrate if (count % 5000).zero?
  end

  def eat_grass
    self.count -= 1
  end
end