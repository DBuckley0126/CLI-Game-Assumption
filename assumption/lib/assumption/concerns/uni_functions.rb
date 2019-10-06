module UniFunctions

  def clear_terminal
    system "clear"
    system "cls"
  end

  def underline
    50.times do
      print "="
      sleep(0.01)
    end
    puts "\n"
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
    puts ""
  end



  def get_char
    state = `stty -g`
    `stty raw -echo -icanon isig`
  
    Signal.trap("INT") do # SIGINT = control-C
      exit
    end
      
    self.input = STDIN.getc.chr
    ensure
    `stty #{state}`
  end

end
