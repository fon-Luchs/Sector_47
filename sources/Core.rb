require_relative "Id"
require_relative "Core_Module"

class Core
  attr_reader :x_cord, :y_cord
  include IdChars
  include Core_Module

  def x_cord=(x_cord)
    if x_cord < 0
      @x_cord = 0
    elsif x_cord > cord_max
      @x_cord = cord_max
    else
      @x_cord = x_cord
    end
  end

  def y_cord=(y_cord)
    if y_cord < 0
      @y_cord = 0
    elsif y_cord > cord_max
      @y_cord = cord_max
    else
      @y_cord = y_cord
    end
  end

  def random_x_cord
    symbol = Random.rand 2
    symbol.zero? ? self.x_cord += 1 : self.x_cord -= 1
  end

  def random_y_cord
    symbol = Random.rand 2
    symbol.zero? ? self.x_cord += 1 : self.x_cord -= 1
  end

  def random_change_cord
    dice = Random.rand 2
    dice.zero? ? random_x_cord : random_y_cord
  end

  def initialize(x_cord = 0, y_cord = 0)
    self.x_cord   = x_cord
    self.y_cord   = y_cord
    self.id_char  = 'C'
  end

  def to_s
    puts "#{x_cord} || #{y_cord} || #{id_char}"
  end

end