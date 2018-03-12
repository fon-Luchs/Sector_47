module Basic

  @population   = 0
  @water_chunks = 0

  def Basic.population_init
    @population += 1
  end

  def Basic.water_chunks_init
    @water_chunks += 1
  end

  def Basic.population?
    puts "Population-> #{@population}"
    @population
  end

  def Basic.water_chunks?
    puts "Water_chunks-> #{@water_chunks}"
    @water_chunks
  end

  def Basic.info
    puts"
          BASIC MODULE INFO
  >Population   -> #{@population}
  >Water_chunks -> #{@water_chunks}
        "

  end
end

#--------------------------------#|
spinner = Enumerator.new do |e|  #|
  loop do                        #|
    for i in (0...10)            #|
      e.yield '|'                #|
      e.yield '/'                #|
      e.yield '-'                #|
      e.yield '\\'               #|
    end                          #|
  end                            #|
end                              #|---->>>> add Sector 47 to_s
                                 #|
1.upto(19) do |i|                #|
  printf("\r%s", spinner.next)   #|
  sleep(0.3)
  printf ">DONE"                 #|
end                              #|
#--------------------------------#|
puts