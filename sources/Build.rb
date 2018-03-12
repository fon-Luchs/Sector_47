class Build
  attr_accessor :id_char
  def initialize (x: 0, y: 0) # <<< add
    @id_char = 'B'.freeze
  end
end