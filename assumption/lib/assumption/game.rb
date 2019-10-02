class Assumption::Game

  @@all = []
  @@id_count = 0

  def self.all
    @@all
  end

  attr_reader :year, :chart_data_set, :current_song, :next_song, :id

  def initialize(year)
    @id = @@id_count + 1
    @year = year
    @chart_data_set = Assumption::ChartDataSet.find_or_create_by_year(year)
    @level = 1
    @@all << self
    @current_song = @chart_data_set.random
    @next_song = @chart_data_set.random
    @end = nil
    self.level
  end

  def level
    input = nil

    puts "Level #{@level}."
    puts "In #{year},"
    puts "was #{@next_song.artist} - #{@next_song.song}"
    puts "higher or lower in the chart"
    puts "than #{@current_song.artist} - #{@current_song.song}"

    loop do
      input = gets.chomp
      self.round_logic
      break if @end
    end

  end

  def round_logic
    @position_dif = @next_song.position - @current_song.position

    input == "h" ? @higher_input = true : @higher_input = false

    if @next_song.position > @current_song.position
      higher_input ? self.next_level(position_dif.abs, "above") : self.end_level(position_dif.abs, "above", "lower")
    elsif @next_song.position < @current_song.position
      !higher_input ? self.next_level(position_dif.abs, "below") : self.end_level(position_dif.abs, "below", "higher")
    else
      put "Error in the game"
    end

  end

  def next_level(position_dif, direction)
    puts "Correct: Level Up!"
    puts "#{@next_song.artist} - #{@next_song.song} was at #{@next_song.position} in the chart and #{@current_song.artist} - #{@current_song.song} was at #{@current_song.position} in the chart in #{year}."
    puts "#{position_dif} #{direction}"
    @level += 1
    @current_song = @next_song
    @next_song = @chart_data_set.random
  end

  def end_level (position_dif, direction, decision)
    puts "Wong: End of game! #{@next_song.song} is definitely not #{decision} than #{@current_song.song}"
    puts "#{@next_song.artist} - #{@next_song.song} was at #{@next_song.position} in the chart and #{@current_song.artist} - #{@current_song.song} was at #{@current_song.position} in the chart in #{year}."
    puts "#{position_dif} #{direction}"
    puts "You got to level #{@level} for the year #{year}..."
    @@id_count = @id
    @end = true
  end

end