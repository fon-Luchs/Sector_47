require_relative "Core"
require_relative "Earth_Module"

class Water < Core
  include Earth_Module
  def initialize(x_cord, y_cord)
    super(x_cord, y_cord)
    self.id_char = 'W'
    add_water self
  end
end