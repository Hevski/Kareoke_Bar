class Rooms

  attr_accessor :genre, :capacity, :songs, :guests, :queue, :fee, :bar_tab

  def initialize(genre, capacity, songs, fee, bar_tab)
    @genre = genre
    @songs = songs
    @capacity = capacity
    @guests = []
    @queue = []
    @fee = fee
    @bar_tab = bar_tab
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

  def add_to_bar_tab(room)
    @bar_tab += room.fee
  end

  def bar_purchase_to_room_tab(room, purchase)
    room.bar_tab += purchase.price
    #binding.pry
  end

  def can_afford_tab(guest)
    guest.wallet >= @bar_tab
  end

  # def pays_bar_tab(guest, room)
  #   guest.wallet -= @bar_tab
  #   @bar_tab += @room1_bar.till
  # end

  # while customer wallet < bar_tab
  # customer can buy drinks, pay fee, hear fave song 

  # pretty sure i havent used the Bar class instancies










end
