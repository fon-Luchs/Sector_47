module IdChars
  attr_reader :id_char
  def id_char=(chars)
    if chars == ''
      raise "Exception #{chars}"
    end
    @id_char = chars
  end
end