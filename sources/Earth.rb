require_relative "Earth_Module"
require_relative "Core_Module"

class Earth
  include Earth_Module
  include Core_Module

  def create(class_, count, years = 0)
    count.times { class_.new Random.rand(cord_max), Random.rand(cord_max), 'M', years}
    count.times { class_.new Random.rand(cord_max), Random.rand(cord_max), 'F', years}
  end

  private def creatures_init
    create Human, 2, 18
    create Animal, 10, 5
    create Hunters, 2, 5
    550_0.times { Grass.new Random.rand(cord_max), Random.rand(cord_max) }
    3000.times { Water.new Random.rand(cord_max), Random.rand(cord_max) }
  end

  def change_starvation(object)
    a = object.size
    (0...a).each do |i|
      break if object.size < a
      object[i].starvation
    end
  end

  def change_thirst(object)
    a = object.size
    (0...a).each do |i|
      break if object.size < a
      object[i].thirst
    end
  end

  def changes
    change_starvation @@hunters
    change_thirst @@hunters
    change_starvation @@humans
    change_thirst @@humans
    change_starvation @@animals
    change_thirst @@animals

    (0...@@grasses.size).each { |i| @@grasses[i].reproduction }

    (0...@@hunters.size).each { |i| @@hunters[i].family_needs if @@hunters[i].year == 5 }
    (0...@@humans.size).each { |i| @@humans[i].family_needs if @@humans[i].year == 18 }
    (0...@@animals.size).each { |i| @@animals[i].family_needs if @@animals[i].year == 5 }
  end

  def needs(mass)
    (0...mass.size).each do |i|
      mass[i].search_food if mass[i].hunger?
      mass[i].search_water if mass[i].thirst?
      mass[i].search_family if mass[i].family?
      mass[i].step
    end
  end

  def walk(count = 1)
    count.times do
      (0...@@hunters.size).each { |i| @@hunters[i].step }
      (0...@@humans.size).each { |i| @@humans[i].step }
      (0...@@animals.size).each { |i| @@animals[i].step }
    end
  end

  def actions
    changes
    needs @@hunters
    needs @@humans
    needs @@animals
  end

  def initialize(cord_min, cord_max)
    self.cord_max = cord_max
    self.cord_min = cord_min
    creatures_init
  end

  def to_s
    # Earth_Module.output
    Earth_Module.output_live_count_increment
  end

end