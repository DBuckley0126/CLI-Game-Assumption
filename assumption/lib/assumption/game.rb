class Assumption::Game

  def initialize

  end

  def year_selection(year)
    Assumption::ChartData.get(year)
    
  end

end