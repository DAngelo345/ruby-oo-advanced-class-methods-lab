require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  new_song  = self.new 
  new_song.save 
  new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name) || self.create_by_name(name)
    new_song
  end

  def self.alphabetical
    @@all.sort_by { |k| k.name }
  end
  
  def self.new_from_filename(file_name)
      song_info = file_name.split('.')
      artist_song = song_info[0].split(' - ')
      new_song = self.new_by_name(artist_song[1])
      new_song.artist_name = artist_song[0]
      new_song
  end
  def self.create_from_filename(file_name)
    song_info = file_name.split('.')
      artist_song = song_info[0].split(' - ')
      new_song = self.new_by_name(artist_song[1])
      new_song.artist_name = artist_song[0]
    new_song.save
    new_song
  end
  def self.destroy_all
    self.all.clear  
  end

 
end
