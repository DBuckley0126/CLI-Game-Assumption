class Assumption::Game

  @@all = []

  def self.all
    @@all
  end

  attr_reader :chart_data_set, :current_song

  def initialize(year)
    @chart_data_set = Assumption::ChartDataSet.find_or_create_by_year(year)
    @level = 1
    @@all << self
    @current_song = @chart_data_set.random
  end

  def level
    
  end

  def question
  
  end


end