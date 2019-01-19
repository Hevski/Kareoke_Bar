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
      #binding.pry
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def count_guests_in_room
    @guests.length
  end

  def add_songs(song)
    @songs << song
  end

  def add_to_queue(guest)
    if @capacity == @guests.length
      @queue << guest
    end
  end

  def pay_fee(guest, room)
    if guest.wallet >= room.fee
      guest.wallet -= room.fee
    end
  end

  def favorite_song(room, guest)
    #binding.pry
    if room.songs.include?(guest.fave_song)
      return "Boom, shake, shake, shake the rooooommm"
  end
end

  def bar_tab_value
    
  end





end
