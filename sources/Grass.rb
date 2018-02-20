class Grass
  attr_accessor :x, :y, :id_char

  def initialize (x, y)
    @x = x
    @y = y
    @id_char = 'G'
    @state = 100
  end
end