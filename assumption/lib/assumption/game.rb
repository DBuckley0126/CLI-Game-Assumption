class Assumption::Game

  include UniFunctions


  @@all = []

  def self.all
    @@all
  end

  attr_accessor :input

  attr_reader :year, :chart_data_set, :id

  def initialize(year)
    @year = year
    @chart_data_set = Assumption::ChartDataSet.find_or_create_by_year(year)
    @level = 1
    @@all << self
    @current_song = @chart_data_set.random
    @next_song = @chart_data_set.random
    @input = nil
    start_level
  end

  private

  def start_level
    
    clear_terminal
    puts "Level #{@level}.".fg("#D13DDB")
    underline
    puts "In #{year},"
    puts "was #{@next_song.artist} - #{@next_song.name}"
    puts "higher or lower in the chart".fg("#147CEE") 
    puts "than #{@current_song.artist} - #{@current_song.name}"

    answer_input
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
    underline
    puts "Correct: Level Up!".fg("#1ADF36") 

    if direction == "higher" #user picked a decision of higher that is right.
      puts "You choose higher"
      next_song_info
      current_song_info
      puts "#{@next_song.name} is #{position_dif} places above"

    else #user picked a decision of lower that is right.
      puts "You choose lower"
      current_song_info
      next_song_info
      puts "#{@next_song.name} is #{position_dif} places below"
    end

    @level += 1
    @current_song = @next_song
    @next_song = @chart_data_set.random
    puts ""
    puts "Press any key to continue"
    get_char
    start_level
  end

  def end_level (position_dif, decision)
    underline
    puts "Wong: End of game! #{@next_song.name} is definitely not #{decision} than #{@current_song.name}".fg("#DC2D1E") 
    if decision == "higher" #user picked a decision of higher that is wrong. Next song would of been lower
      puts "You choose higher"
      current_song_info
      next_song_info
      puts "#{@next_song.name} is #{position_dif} places below"
    else #user picked a decision of lower that is wrong. Next song would of been higher
      puts "You choose lower"
      next_song_info
      current_song_info
      puts "#{@next_song.name} is #{position_dif} places above"
    end

    puts "You got to level #{@level} for the year #{year}..."
    puts ""
  end

  def answer_input
    get_char
    if @input == "h" || @input == "l"
      round_logic
    else
      puts "Please answer with h for higher or l for lower"
      answer_input
    end
  end

  def current_song_info
    puts "#{@current_song.position}. #{@current_song.artist} - #{@current_song.name}"
  end

  def next_song_info
    puts "#{@next_song.position}. #{@next_song.artist} - #{@next_song.name}"
  end


end