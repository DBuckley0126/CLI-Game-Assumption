class Assumption::CLI

  include UniFunctions

  attr_accessor :input
  
  def start_sequence
    clear_terminal
    title
    self.begin
  end
  
  def begin
    puts 'Type the chart year you would like to play between 1954-2019'
    
    year_input

    puts 'Would you like to play again? (y/n)'
    get_char
    @input == 'y' ? start_sequence : exit
  end

  private

  def year_input
    @input = gets.to_i

    if (1954..2019).include?(@input)
      Assumption::Game.new(@input)
    elsif @input.to_s.size != 4
      puts 'Must be 4 digits' 
      year_input
    elsif !(1954..2019).include?(@input)
      puts 'Must be within 1954-2019'
      year_input
    else
       puts 'Error'
       exit
    end
  end

end