puts "        _________   _________   _________   _____________   __________   __________"
puts "       /        /  /   _____/  /        /  /            /  /         /  /         /"
puts "      /    /___/  /   /____   /    /   /  /__       ___/  /     /   /  /   /     / "
puts "     /___     /  /   _____/  /    /___/      /     /     /     /   /  /   /_____/  "
puts "    /   /    /  /   /____   /    /   /      /     /     /     /   /  /      /      "
puts "   /________/  /________/  /________/      /_____/     /_________/  /______/       "
puts "\n"
puts "                                 ____ __   __________"
puts "                                /    |  |  |        |"
puts "                                |    |  |  |____|   |"
puts "                                |    |  |      /   /"
puts "                                |____   |     /   /"
puts "                                    |   |    /   /"
puts "                                    |___|   /___/"



def dec2bin number
  number = Integer number
  if number == 0 then 0 end

  ret_bin = " "
  while number != 0
    ret_bin = String number % 2 + ret_bin
    number = number / 2
  end
  ret_bin
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

encrypt "string", "key"