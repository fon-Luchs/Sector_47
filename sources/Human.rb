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

  def hunger?
    super
  end

  def thirst?
    super
  end

  def starvation
    super
  end

  def thirst
    super
  end

  def eat(mass_elem)
    if mass_elem.class == Grass
      mass_elem.eat
      self.hunger -= 10
    elsif mass_elem.class == Hunters
      mass_elem.self_multiplicity.delete mass_elem
      self.hunger -= 35
    else
      mass_elem.self_multiplicity.delete mass_elem
      self.hunger -= 25
    end
  end

  def population_control(target, protected)
    if target.size > (protected.size / 2)
      (0...target.size).each do |i|
        if equals? target[i]
          eat target[i]
          break
        end
      end
    end
  end

  def search_food
    population_control @@hunters, @@animals
    population_control @@animals, @@grasses
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
    family_needs if year == 22
  end

  def to_s
    super
  end
end