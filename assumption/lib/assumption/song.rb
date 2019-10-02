class Assumption::Song

  attr_reader :position, :name, :artist
  def initialize (position, name, artist)
    @position = position
    @name = name
    @artist = artist
  end
end