require_relative "Nature"
require_relative "Earth_Module"
class Tree < Nature
  include Earth_Module
  def initialize(x_cord, y_cord)
    super
    self.id_char = 'T'
    add_tree self
  end
end