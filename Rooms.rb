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
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_songs(song)
    @songs << song
  end

  def add_to_queue(guest)
    return if @capacity != @guests.length
      @queue << guest
    end

  def add_fee_to_bar_tab(guest, room)
    guest.wallet >= room.fee
    @bar_tab += room.fee
  end

  def favorite_song(room, guest)
    return if !room.songs.include?(guest.fave_song)
      "Boom, shake, shake, shake the rooooommm"
    end

  def bar_purchase_to_room_tab(room, purchase)
    room.bar_tab += purchase.price
  end

  def bar_tab_paid(guest, room_bar)
    if @bar_tab > guest.wallet
      room_bar.till += guest.wallet
      guest.wallet = 0
      @bar_tab = 0
      forfeit(guest)
    else
      guest.wallet -= @bar_tab
      room_bar.till += @bar_tab
      @bar_tab = 0
    end
  end

  # could add dishes from food and drink purchased to dirt_dishes array
  # when guest does forfeit, dishes are reduced from array

  def forfeit(guest)
    "#{guest.name} is washing dishes whilst singing #{guest.fave_song}"
  end
end
