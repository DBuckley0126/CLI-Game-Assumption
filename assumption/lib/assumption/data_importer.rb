require "open-uri"
require "nokogiri"

class Assumption::DataImporter

  attr_reader :output

  def initialize (year)
    doc = Nokogiri::HTML(open("http://www.uk-charts.top-source.info/top-100-#{year}.shtml"))
    @output = transform(doc)
  end


  def transform(doc)
    obj_array = []
    doc.css("table.sortable tbody tr").each do |row|
      song = Assumption::Song.new(row.css("td")[0].text.to_i, row.css("td")[2].text, row.css("td")[1].text)
      obj_array << song
    end
    obj_array
  end

end