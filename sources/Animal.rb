require_relative "Creatures"
require_relative "Earth_Module"

class Animal < Creatures
  include Earth_Module
  def initialize(x_cord, y_cord, gender, year = 0)
    super(x_cord, y_cord, gender, year)
    self.id_char = 'A'
    @self_multiplicity = @@animals
    add_animal self
  end

  def hp=(hp)
    die_from self_multiplicity if hp < 0
    super
  end

  def hunger?
    super
  end

  def thirst?
    true if sprite >= 5
  end

  def starvation
    super
  end

  def thirst
    super
  end

  def search_food
    super
  end

  def day_changes
    super
    family_needs if year == 3
  end

  def family_offer(object)
    num1 = Random.rand 6
    num2 = Random.rand 6
    reproduction object if num1 == num2
  end

  def family_needs
    rnd = Random.rand 2
    if family != 100
      self.family += 2 if rnd.zero?
    end
  end

  def to_s
    super
  end
end