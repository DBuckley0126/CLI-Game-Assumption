require "pry"
require "nokogiri"
require "open-uri"

class Assumption::ChartDataSet

  @@all = []

  def self.find_or_create_by_year(year)
    var = self.all.find { |set| set.year == year}
    var ? var : Assumption::ChartDataSet.new(year)
  end

  def self.all
    @@all
  end

  attr_accessor :chart_array, :year

  def initialize(year)
    @year = year
    @chart_song_array = Assumption::DataImporter.new(year).output
    @@all << self
  end

  def random
    @chart_song_array.sample
  end

end