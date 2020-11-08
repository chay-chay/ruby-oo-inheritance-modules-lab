require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods

 
  @@artists = []

  def initialize
    @@artists << self # or use "super" instead - for  super keyword to tell our Artist's .initialize method to 
    #use the code in the Memorable::InstanceMethods module's .initialize method and also to use any additional code in the Artist's .initialize method.
    @songs = []
  end



  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

end
