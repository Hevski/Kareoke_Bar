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

  def add_fee_to_bar_tab(guest, room)
    guest.wallet >= room.fee
    @bar_tab += room.fee
    #guest.wallet -= room.fee
  end

  def favorite_song(room, guest)
    #binding.pry
    if room.songs.include?(guest.fave_song)
      return "Boom, shake, shake, shake the rooooommm"
    end
  end

  def bar_purchase_to_room_tab(room, purchase)
    room.bar_tab += purchase.price
    #binding.pry
  end


  # def can_afford_tab(guest)
  #   guest.wallet >= @bar_tab
  # end

  def bar_tab_paid(guest, room_bar)
    if @bar_tab > guest.wallet
      room_bar.till += guest.wallet
      guest.wallet = 0
      @bar_tab = 0
      forfeit(guest)
    elsif @bar_tab < guest.wallet
      guest.wallet -= @bar_tab
      room_bar.till += @bar_tab
      @bar_tab = 0
    end
  end

  def forfeit(guest)
    return "#{guest.name} is washing dishes whilst singing #{guest.fave_song}"
  end

  # def bar_tab_paid(guest, room_bar)
  #   guest.wallet -= @bar_tab
  #   room_bar.till += @bar_tab
  #   @bar_tab = 0
  # end













end
