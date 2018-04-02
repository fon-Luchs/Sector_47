class Empty_Space
  attr_accessor :id_char

  def initialize
    @id_char = '*'.freeze
  end

  def through?
    true
  end
end

