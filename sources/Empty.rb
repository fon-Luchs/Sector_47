class Empty_Space
  attr_accessor :id_char

  def initialize
    @id_char = 'ES'.freeze
  end

  def through?
    true
  end
end