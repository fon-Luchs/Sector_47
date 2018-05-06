module Earth_Module
  attr_reader :animals, :humans, :waters, :trees, :hunters, :grasses

  @@animals = []
  @@humans  = []
  @@waters  = []
  @@trees   = []
  @@hunters = []
  @@grasses = []

  @@live_count = 0
  @@nature_count = 0
  def add_animal(object)
    object.id_char == 'A' ? @@animals.push(object) : raise("#{object} is not animal")
  end

  def add_human(object)
    object.id_char == 'H' ? @@humans.push(object) : raise("#{object} is not human")
  end

  def add_water(object)
    object.id_char == 'W' ? @@waters.push(object) : raise("#{object} is not water")
  end

  def add_tree(object)
    object.id_char == 'T' ? @@trees.push(object) : raise("#{object} is not tree")
  end

  def add_hunter(object)
    object.id_char == 'AH' ? @@hunters.push(object) : raise("#{object} is not hunter")
  end

  def add_grass(object)
    object.id_char == 'G' ? @@grasses.push(object) : raise("#{object} is not grass")
  end

  class << self

    def live_count_increment
      @@live_count += 1
    end

    def nature_count_increment
      @@nature_count += 1
    end

    def live_count_decrement
      @@live_count -= 1
    end

    def nature_count_decrement
      @@nature_count -= 1
    end

    def output_mass(mass_object)
      if mass_object.class == Array
        print "#{mass_object[0].class} "
        (0...mass_object.size).each { |i| print "#{i + 1} " }
        puts
      else
        raise "#{mass_object} is not array"
      end
    end

    def output
      output_mass @@grasses # Done
      output_mass @@animals # Done
      output_mass @@hunters # Done
      output_mass @@humans  # Done
      output_mass @@trees   # DOne
      output_mass @@waters  # Done
    end

    def output_live_count_increment
      puts "#{'^' * 37}"
      print "C> #{@@live_count} | N> #{@@nature_count}"
      puts
    end

  end
end
