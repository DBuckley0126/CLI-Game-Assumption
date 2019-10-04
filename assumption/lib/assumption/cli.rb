require 'tco'
class Assumption::CLI

  def start_sequence
    system "clear"
    system "cls"
    title
    self.begin
  end
  
  def begin
    puts 'Type the chart year you would like to play between 1954-2019'
    

    self.user_input


    puts 'Would you like to play again? (y/n)'
    @input = gets.strip.downcase
    @input == 'y' ? self.begin : exit
  end

  def user_input
    @input = gets.to_i

    if (1954..2019).include?(@input)
      Assumption::Game.new(@input)
    elsif @input.to_s.size != 4
      puts 'Must be 4 digits' 
      user_input
    elsif !(1954..2019).include?(@input)
      puts 'Must be within 1954-2019'
      user_input
    else
       puts 'Error'
       exit
    end
  end

  def title
    
    puts '  ___                                _   _             '
    sleep(0.1)
    puts ' / _ \                              | | (_)            '
    sleep(0.1)
    puts '/ /_\ \___ ___ _   _ _ __ ___  _ __ | |_ _  ___  _ __  '
    sleep(0.1)
    puts '|  _  / __/ __| | | |  _ ` _ \|  _ \| __| |/ _ \|  _ \ '
    sleep(0.1)
    puts '| | | \__ \__ \ |_| | | | | | | |_) | |_| | (_) | | | |'
    sleep(0.1)
    puts '\_| |_/___/___/\__,_|_| |_| |_| .__/ \__|_|\___/|_| |_|'
    sleep(0.1)
    puts '                              | |                      '
    sleep(0.1)
    puts '                              |_|                      '

  end

end