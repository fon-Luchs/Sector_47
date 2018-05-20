require_relative "Creatures"
require_relative "Earth_Module"

class Hunters < Creatures
  include Earth_Module
  def initialize(x_cord, y_cord, gender, year = 0)
    super(x_cord, y_cord, gender, year)
    self.id_char = 'AH'
    @self_multiplicity = @@hunters
    add_hunter self
  end

  def hp=(hp)
    die_from self_multiplicity if hp < 0
    super
  end

  def hunger?
    true if hunger >= 5
  end

  def eat(mass_elem)
    self_multiplicity.delete mass_elem
    self.hunger -= 25
  end

  def search_food
    (0...@@animals.size).each do |i|
      if equals? @@animals[i]
        eat @@animals[i]
        break
      end
    end
    super if hunger?
  end

  def family_offer(object)
    num1 = Random.rand(11)
    num2 = Random.rand(11)
    reproduction object if num1 == num2
  end

  def family_needs
    if family != 100
      self.family += 1
    end
  end

  def day_changes
    super
    family_needs if year == 5
  end

  def to_s
    super
  end
end