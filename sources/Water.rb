class Water
  attr_accessor :id_char

  def initialize ()
=begin
    @x = x #
    @y = y #
=end
    @id_char = 'W'
  end

  def to_s
    puts "#{@id_char}"
  end
end

=begin
------------------------------------
    rnd = Random.new
    symbol = rnd.rand 2
    if symbol == 1
      dice = rnd.rand 2
      dice == 1 ? @x += 1 : @y += 1
    else
      dice = rnd.rand 2
      dice == 1 ? @x -= 1 : @y -= 1
------------------------------------
    loop do
      for i_x in 1...run
        if run % 2 == 0
          num += 1
          arr[x -= 1][y] = num
        else
          num += 1
          arr[x += 1][y] = num
        end
      end

      for i_y in 1...run
        if run % 2 == 0
          num += 1
          arr[x][y -= 1] = num
        else
          num += 1
          arr[x][y += 1] = num
        end

      end

      run += 1

    if run == arr.size + 1
      for i in 1...arr.size
        num += 1
        if size % 2 == 0
          arr[x += 1][y] = num
        else
          arr[x -= 1][y] = num
        end
      end
      break
    end
  end
------------------------------------
=end