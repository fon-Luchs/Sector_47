require_relative "Earth_Module"

class Nature < Core
  include Earth_Module
  attr_reader :count

  def count=(count)
    if count <= 0
      die
    else
      @count = count
    end
  end

  def initialize(x_cord, y_cord)
    super(x_cord, y_cord)
    self.id_char = 'N'
    self.count = 1
    Earth_Module.nature_count_increment
  end

  def reproduction
    self.count += 1
  end

  def nature_migrate
    puts "OLD #{x_cord} || #{y_cord}"
    random_change_cord
    puts "NEW #{x_cord} || #{y_cord}"
    self.class.new x_cord, y_cord
  end

  def die
    puts "Grass is die"
    Earth_Module.nature_count_decrement
    @@grasses.delete self
  end

end