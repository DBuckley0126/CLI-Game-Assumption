class Assumption::Game

  @@all = []

  attr_reader :year, :chart_data

  def initialize(year)
    @year = year
    @level = 1
    @chart_data_set = Assumption::ChartDataSet.find_or_create_by_year(year)
    @@all << self
  end

  def play
    
  end

  def question
  
  end


end