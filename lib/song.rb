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
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.each do | song |
      if song.name == name
        return song
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    
    if song == nil
      song = self.create_by_name(name)
    end
    
    song
  end
  
  def self.alphabetical
    self.all.sort_by { | song | song.name }
  end
  
  def self.new_from_filename(song)
    song_array = song.split("-")
    artist_name = song_array[0].strip
    name_array = song_array[1].split(".")
    name = name_array[0].strip
    
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    self.all << song
  end
  
  def self.destroy_all
    self.all.clear
  end
end