require_relative "Creatures"
require_relative "Earth_Module"

class Human < Creatures
  include Earth_Module
  def initialize(x_cord, y_cord, gender, year = 0)
    super(x_cord, y_cord, gender, year)
    self.id_char = 'H'
    @self_multiplicity = @@humans
    add_human self
  end

  def hp=(hp)
    die_from self_multiplicity if hp < 0
    super
  end

  def search_food

    super
  end

  def day_changes
    super
    family_needs if year == 22
  end

  def to_s
    super
  end
end