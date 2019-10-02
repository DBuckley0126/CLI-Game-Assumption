class Assumption::CLI

  
  def call
    puts "Type the chart year you would like to play"
    puts "1952-2019"

    loop do
      @input = gets.chomp
        puts "Must be 4 digits" if @input.to_s.size != 4 or !@input.is_a? Integer
        puts "Must be within 1952-2019" if !(1952..2019).include?(@input)
        var = true if (1952..2019).include?(@input)
      break if var
    end

    Assumption::Game.new(@input)
    
  end


end