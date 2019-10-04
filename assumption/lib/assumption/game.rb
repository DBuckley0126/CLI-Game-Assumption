require "tco"
class Assumption::Game

  @@all = []
  @@id_count = 0

  def self.all
    @@all
  end

  attr_reader :year, :chart_data_set, :id

  def initialize(year)
    @id = @@id_count + 1
    @year = year
    @chart_data_set = Assumption::ChartDataSet.find_or_create_by_year(year)
    @level = 1
    @@all << self
    @current_song = @chart_data_set.random
    @next_song = @chart_data_set.random
    @input = nil
    start_level
  end



  def start_level
    puts "Level #{@level}.".fg("#EF1E10")
    puts "In #{year},"
    puts "was #{@next_song.artist} - #{@next_song.name}"
    puts "higher or lower in the chart"
    puts "than #{@current_song.artist} - #{@current_song.name}"

    input
  end

  def round_logic
    @position_dif = @next_song.position - @current_song.position

    @input == "h" ? @higher_input = true : @higher_input = false

    if @next_song.position < @current_song.position
      @higher_input ? next_level(@position_dif.abs, "higher") : end_level(@position_dif.abs, "lower")
    elsif @next_song.position > @current_song.position
      !@higher_input ? next_level(@position_dif.abs, "lower") : end_level(@position_dif.abs, "higher")
    else
      put "Error in the game"
    end
  end

  def next_level(position_dif, direction)
    puts "Correct: Level Up!"

    if direction == "higher" #user picked a decision of higher that is right.
      next_song_info
      current_song_info
      puts "#{@next_song.name} is #{position_dif} places above"

    else #user picked a decision of lower that is right.
      current_song_info
      next_song_info
      puts "#{@next_song.name} is #{position_dif} places below"
    end

    @level += 1
    @current_song = @next_song
    @next_song = @chart_data_set.random
    start_level
  end

  def end_level (position_dif, decision)
    puts "Wong: End of game! #{@next_song.name} is definitely not #{decision} than #{@current_song.name}"
    if decision == "higher" #user picked a decision of higher that is wrong. Next song would of been lower
      current_song_info
      next_song_info
      puts "#{@next_song.name} is #{position_dif} places below"
    else #user picked a decision of lower that is wrong. Next song would of been higher
      next_song_info
      current_song_info
      puts "#{@next_song.name} is #{position_dif} places above"
    end

    puts "You got to level #{@level} for the year #{year}..."
    @@id_count = @id
    @end = true
  end

  def input
    @input = gets.strip.downcase
    
    if @input == "h" || @input == "l"
      round_logic
    else
      puts "Please answer with h for higher or l for lower"
      input
    end
  end

  def current_song_info
    puts "#{@current_song.position}. #{@current_song.artist} - #{@current_song.name}"
  end

  def next_song_info
    puts "#{@next_song.position}. #{@next_song.artist} - #{@next_song.name}"
  end

end