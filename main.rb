load "Sector_47.rb"

puts "+-------------------------------------------------------------------------------------+"
puts "|                                                                                     |"
puts "|        _________   _________   _________   _____________   __________   __________  |"
puts "|       /        /  /   _____/  /        /  /            /  /         /  /         /  |"
puts "|      /    /___/  /   /____   /    /   /  /__       ___/  /     /   /  /   /     /   |"
puts "|     /___     /  /   _____/  /    /___/      /     /     /     /   /  /   /_____/    |"
puts "|    /   /    /  /   /____   /    /   /      /     /     /     /   /  /      /        |"
puts "|   /________/  /________/  /________/      /_____/     /_________/  /______/         |"
puts "|                                                                                     |"
puts "|                                                                                     |"
puts "|                                 ____ __    ________                                 |"
puts "|                                /    |  |  |        |                                |"
puts "|                                |    |  |  |____|   |                                |"
puts "|                                |    |  |      /   /                                 |"
puts "|                                |____   |     /   /                                  |"
puts "|                                    |   |    /   /                                   |"
puts "|                                    |___|   /___/                                    |"
puts "|                                      is life?                                       |"
puts "|                                       v 0.2                                         |"
puts "+-------------------------------------------------------------------------------------+"

tst = Sector_47.new 10, 10
leon = tst.generation #<<<<<<<<<<<
puts tst
tst.walk leon, 2  #<<<<<<<<<<
puts tst
########################################################################
def number_or_nil string
  num = string.to_i
  num if num.to_s == string
end


def dec2bin number
  p = 0
  two_p = 0
  output = ""

  while two_p * 2 <= number do
    two_p = 2 ** p
    output << ((two_p & number == two_p) ? "1" : "0")
    p += 1
  end

  number_or_nil ( output.reverse )
end

def encrypt string, key
  sox_in = []
  string.each_byte {|c| sox_in.push c}
  print "\n"
  som_in = []
  key.each_byte {|c| som_in.push c}
  print "#{sox_in} #{som_in}"

  sox_out = []
  som_out = []

end

a = dec2bin 10

encrypt "string", "key"
##########################################################################