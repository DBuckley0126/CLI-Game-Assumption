require "open-uri"
require "nokogiri"
require "pry"

#doc.css("table.sortable tbody tr td") finds each row in the chart, gives back an array of 3 elements (postion, artist, title)
#doc.css("table.sortable tbody tr").first.css("td")[2].text

class Assumption::ChartData

  @@all = []

  attr_accessor :doc, :chart_data

  def initialize(year) #needs to check if already exsists
    @year = year
    @doc = Nokogiri::HTML(open("http://www.uk-charts.top-source.info/top-100-#{year}.shtml"))
    @chart_data = []
    self.create
    @@all << self
  end


  def create
    doc.css("table.sortable tbody tr").each do |row|
      row_array = [row.css("td")[0].text.to_i, row.css("td")[1].text, row.css("td")[2].text]
      @chart_data << row_array
    end
  end

end
