class Guests
  attr_accessor :name, :wallet, :fave_song

  def initialize(name, wallet, fave_song)
    @name = name
    @wallet = wallet
    @fave_song = fave_song
  end
end
