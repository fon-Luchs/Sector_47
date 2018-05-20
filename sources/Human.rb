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

  def eat(mass_elem)
    self_multiplicity.delete mass_elem
    self.hunger -= 25
  end

  def search_food
    if @@animals.size > (@@grasses.size / 2)
      (0...@@animals.size).each do |i|
        if equals? @@animals[i]
          eat @@animals[i]
          break
        end
      end
    elsif @@hunters.size > (@@animals.size / 2)
      (0...@@hunters.size).each do |i|
        if equals? @@hunters[i]
          eat @@hunters[i]
          break
        end
      end
    end
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