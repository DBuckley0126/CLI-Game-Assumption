require "open-uri"
require "nokogiri"

class Assumption::DataImporter

  attr_reader :output

  def initialize (year)
    doc = Nokogiri::HTML(open("http://www.uk-charts.top-source.info/top-100-#{year}.shtml"))
    @output = transform(doc)
  end


  def transform(doc)
    chart_array = []
    doc.css("table.sortable tbody tr").each do |row|
      row_array = [row.css("td")[0].text.to_i, row.css("td")[1].text, row.css("td")[2].text]
      chart_array << row_array
    end
    chart_array
  end

end