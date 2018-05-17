require_relative "Core"
require_relative "Core_Module"
require_relative "Grass"
require_relative "Earth_Module"
require_relative "Name_Generator"

class Creatures < Core
  include Core_Module
  include Earth_Module
  extend Name_Generator
  attr_reader :name, :hp, :year, :hunger, :sprite, :gender, :family,
              :children, :memory, :self_multiplicity, :day

  private def name=(name) ## <---
    if name == ''
      raise "Name == #{name}"
    end
    @name = name
  end

  private def x_cord=(x_cord)
    super
  end

  private def y_cord=(y_cord)
    super
  end

  private def gender=(gender)
    gender == 'M' || gender == 'F' ? @gender = gender : raise("gender#{gender}")
  end

  def memory=(memory)
    raise"#{memory} is't hash" if memory.class != Hash
    @memory = memory
  end

  def family=(family)
    raise"Exception family has incorrect input '#{family} < 0'" if family < 0
    raise"Exception family has incorrect input '#{family} > 100'" if family > 100
    @family = family
  end

  def day=(day)
    day < 0 ? raise('ERROR DAY < 0') : @day = day
  end

  private def die_from(in_mass)
    puts "#{self.class} #{name} is die"
    in_mass.delete self
    Earth_Module.live_count_decrement
  end

  def sex
    'F' if gender == 'M'
    'M'
  end

  def family_offer(object)
    num1 = Random.rand(16)
    num2 = Random.rand(16)
    # if num1 + num2 != 10
    #   puts'FIRST'
    #   sweetheart object
    #   object.sweetheart self
    #   true
    # end
    # if num1 == num2
    #   puts'SECOND'
    #   sweetheart object, true
    #   object.sweetheart self, true
    #   true
    # end
    # if num1 + num2 == 10
    #   puts'333'
    #   memory.clear
    #   false
    # end
    #puts 'to -> repr'
    reproduction object if num1 == num2
  end

  def search_family
    (0...self_multiplicity.size).each do |i|
      if self_multiplicity[i].family == 100 && self_multiplicity[i].gender == sex
        break if family_offer self_multiplicity[i] # <---
      end
    end
  end

  def family_life
    rnd = Random.rand(5)
    self.children += 1 if rnd == 2
  end

  def sweetheart_live
    step
    unless equals? memory[:sweetheart]
      memory[:sweetheart].x_cord = x_cord
      memory[:sweetheart].y_cord = y_cord
    end
    family_offer memory[:sweetheart]
  end

  def reproduction(object)
    gdr = if Random.rand(2).zero?
            'F'
          else
            'M'
          end
    self.class.new object.x_cord, object.y_cord, gdr if object.gender == 'F'
    self.class.new x_cord, y_cord, gdr
    self.family = 0
  end

  def family_needs
    if family != 100
      rnd = Random.rand 2
      self.family += 2 if rnd == 1
    end
  end

  def family?
    true if family == 100
  end

  def sweetheart(object, family = false)
    family ? memory[:family] = object : memory[:sweetheart] = object
  end

  def hp=(hp)
    hp < 0 ? puts('death') : @hp = hp
  end

  def year=(year)
    year < 0 ? raise("#{year} < 0") : @year = year
  end

  def hunger=(hunger)
    die_from self_multiplicity if hunger == 100
    @hunger = hunger
  end

  def sprite=(sprite)
    die_from self_multiplicity if sprite == 100
    @sprite = sprite
  end

  def hunger?
    true if hunger >= 10
  end

  def starvation
    self.hunger += 5
  end

  def equals?(object)
    x_cord == object.x_cord && y_cord == object.y_cord ? true : false
  end

  def step
    symbol = Random.rand(2)
    dice   = Random.rand(2)
    if symbol.zero?
      dice.zero? ? self.x_cord += 1 : self.y_cord += 1
    else
      dice.zero? ? self.x_cord -= 1 : self.y_cord -= 1
    end
  end

  def thirst
    self.sprite += 5
  end

  def eat(mass_elem)
    # puts "#{name} is eating"
    @hunger -= if mass_elem.id_char == 'G'
                 mass_elem.eat_grass
                 15
               else
                 0
               end
  end

  def search_food
    (0...@@grasses.size).each do |i|
      if equals? @@grasses[i]
        eat @@grasses[i]
        break
      end
    end
  end

  def drink
    # puts "#{name} is Drink"
    @sprite -= 10
  end

  def search_water
    (0...@@waters.size).each do |i|
      drink if equals? @@waters[i]
    end
  end

  def thirst?
    true if sprite >= 20
  end

  def time
    self.day += 1
    self.year += 1 if self.day == 365
  end

  def day_changes
    starvation
    thirst
    family_needs
    time
  end

  def day_actions
    search_food if hunger?
    search_water if thirst?
    search_family if family?
    step
  end

  def initialize(x_cord, y_cord, gender, year = 0, name = Creatures.name_generator, hp = Random.rand(50) + 10)
    super(x_cord, y_cord)
    self.name     = name
    self.hp       = hp
    self.id_char  = 'C'
    self.day      = 0
    self.year     = year
    self.hunger   = 0
    self.sprite   = 0
    self.gender   = gender
    self.memory   = {}
    self.family   = 0
    @self_multiplicity = []
    Earth_Module.live_count_increment
  end

  def to_s
    puts "\nClLASS: #{self.class}"
    puts "ID: #{object_id}\nID_CHAR: #{id_char}"
    puts "NAME: #{name}\nYEAR: #{year}"
    puts "STATE: #{hp}\n(X: #{x_cord} | Y: #{y_cord})"
    puts "GENDER: #{gender}\nFAMILY: #{family}"
    puts "SPRITE: #{sprite}\nHUNGER: #{hunger}"
  end

  class << self

    def name_generator
      take_name
    end

  end
end


