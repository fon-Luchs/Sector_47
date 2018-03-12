class Dirt
  attr_accessor :id_char

  def initialize
    @id_char = '0'.freeze
  end

  def through?
    true
  end
end