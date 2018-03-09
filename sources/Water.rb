class Water
  attr_accessor :id_char

  def initialize
    @id_char = 'W'.freeze
  end

  def through?
    false
  end

end