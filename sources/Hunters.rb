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

  def eat(mass_elem)
    self_multiplicity.delete mass_elem
    Earth_Module.live_count_decrement
    self.hunger -= 25
  end

  def search_food
    rnd = Random.rand(4)
    if rnd.zero?
      super
    else
      (0...@@animals.size).each do |i|
        if equals? @@animals[i]
          eat @@animals[i]
          break
        end
      end
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