require_relative "Nature"
require_relative "Earth_Module"

class Grass < Nature
  include Earth_Module
  def initialize(x_cord, y_cord, count = 1)
    super(x_cord, y_cord, count)
    self.id_char = 'G'
    add_grass self
  end

  def reproduction
    super
    nature_migrate if (count % 1000).zero?
  end
end