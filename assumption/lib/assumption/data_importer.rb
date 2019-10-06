class Assumption::DataImporter

  include UniFunctions

  attr_reader :output
  attr_writer :input

  def initialize (year)
    
  begin
    html = open("http://www.uk-charts.top-source.info/top-100-#{year}.shtml")
  rescue OpenURI::HTTPError => error
    response = error.io
    clear_terminal
    puts "Source error, please contact gem creator"
    puts response.status
    puts "Press any key to exit"
    get_char
    exit
  end 

  doc = Nokogiri::HTML(html)
  @output = transform(doc)

  end

  private

  def transform(doc)
    obj_array = []
    doc.css("table.sortable tbody tr").each do |row|
      song = Assumption::Song.new(row.css("td")[0].text.to_i, row.css("td")[2].text.split.map(&:capitalize).join(' '), row.css("td")[1].text.split.map(&:capitalize).join(' '))
      obj_array << song
    end
    obj_array
  end

end