class Rooms

  attr_accessor :genre, :capacity, :songs, :guests

  def initialize(genre, capacity, songs)
    @genre = genre
    @songs = songs
    @capacity = capacity
    @guests = []
  end

  def check_in(guest)
    if @capacity >= @guests.size
      @guests << guest
    end

  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_songs(song)
    @songs << song
    #binding.pry
  end


end
