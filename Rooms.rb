class Rooms

  attr_accessor :genre, :capacity, :songs, :guests, :queue, :fee

  def initialize(genre, capacity, songs, fee)
    @genre = genre
    @songs = songs
    @capacity = capacity
    @guests = []
    @queue = []
    @fee = fee
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
  end

  def add_to_queue(guest)
    if @capacity == @guests.length
      @queue << guest
    end
  end

  def afford_fee(guest, room)
    #binding.pry
    if guest.wallet >= room.fee
      guest.wallet -= room.fee
    end
  end




end
