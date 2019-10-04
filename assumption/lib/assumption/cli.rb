class Assumption::CLI

  def call
    puts "Type the chart year you would like to play between 1954-2019"
    

    self.user_input


    puts "Would you like to play again? (y/n)"
    @input = gets.strip.downcase
    @input == "y" ? self.call : exit
  end

  def user_input
    @input = gets.to_i

    if (1954..2019).include?(@input)
      Assumption::Game.new(@input)
    elsif @input.to_s.size != 4
      puts "Must be 4 digits" 
      self.user_input
    elsif !(1954..2019).include?(@input)
      puts "Must be within 1954-2019"
      self.user_input
    else
       puts "Error"
       exit
    end
  end

end