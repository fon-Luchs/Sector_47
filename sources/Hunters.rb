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
    true if hunger >= 10
  end

  def thirst?
    true if sprite >= 5
  end

  def starvation
    self.hunger += 5
  end

  def thirst
    self.sprite += 5
  end

  def eat(mass_elem)
    if mass_elem.class == Grass
      mass_elem.eat
      self.hunger -= 10
    else
      mass_elem.self_multiplicity.delete mass_elem
      self.hunger -= 25
    end
  end

  def go_eat(mass_elem)
    (0...mass_elem.size).each do |i|
      if equals? mass_elem[i]
        eat mass_elem[i]
        break
      end
    end
  end

  def search_food
    rnd = Random.rand 2
    go_eat @@animals
    go_eat @@humans if rnd.zero?
    super if hunger?
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

  def day_changes
    super
    family_needs if year == 5
  end

  def to_s
    super
  end
end