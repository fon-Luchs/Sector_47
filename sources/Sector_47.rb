require_relative "Animal"
require_relative "Earth"
require_relative "Grass"
require_relative "Human"
require_relative "Hunters"
require_relative "Tree"
require_relative "Water"

class Sector_47
  attr_reader :earth

  def initialize(cord_min, cord_max)
    @earth = Earth.new cord_min, cord_max
  end

  def live_cycle(time = 1)
    (0...time).each do |i|
      puts "STEP >>> #{i}"
      earth.actions
      to_s
    end
  end

  def to_s
    puts earth
  end

end