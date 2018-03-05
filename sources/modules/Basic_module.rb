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

Basic.info

