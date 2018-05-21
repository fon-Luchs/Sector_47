require_relative "Earth_Module"
require_relative "Core_Module"

class Earth
  include Earth_Module
  include Core_Module

  private def create(class_, count, years = 0)
    count.times { class_.new Random.rand(cord_max), Random.rand(cord_max), 'M', years}
    count.times { class_.new Random.rand(cord_max), Random.rand(cord_max), 'F', years}
  end

  private def creatures_init
    create Human, 100, 22
    create Animal, 100, 3
    create Hunters, 100, 5
    6000.times { Grass.new Random.rand(cord_max), Random.rand(cord_max), 100 }
    4000.times { Water.new Random.rand(cord_max), Random.rand(cord_max) }
  end

  def nature_reproduction(mass)
    (0...mass.size).each { |i| mass[i].reproduction }
  end

  def creatures_changes(mass)
    size = mass.size
    (0...size).each do |i|
      break if mass.size < size
      mass[i].day_changes
    end
  end

  def creatures_actions(mass)
    size = mass.size
    (0...size).each do |i|
      break if mass.size < size
      mass[i].day_actions
    end
  end

  def changes
    creatures_changes @@hunters
    creatures_changes @@humans
    creatures_changes @@animals
    nature_reproduction @@grasses
  end

  def actions
    changes
    creatures_actions @@hunters
    creatures_actions @@humans
    creatures_actions @@animals
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