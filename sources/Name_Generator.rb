module Name_Generator
  attr_accessor :named, :stored_names, :ra, :rc

  @@ra = "_AEIOUY".chars.to_a
  @@rc = "_BCDGHFVJKLMNPQRSTWXZ".chars.to_a

  def take_name
    @stored_names = []
    name
    @stored_names
  end

  def name
    @named = ''
    2.times do
      @named << @@rc.sample
      @named << @@ra.sample
    end
    @named << rand(0..999).to_s
    save_name
    check_name
  end

  def save_name
    @stored_names << @named
  end

  def check_name
    @stored_names.uniq!
  end

  def reset
    @stored_names = []
  end

end