class Genre

    attr_accessor :name

    @@all = []

    def initialize(name) #has a name. has many and has many through
        @name = name
        @@all << self
    end
    
    def self.all #knows all about genre instances
        @@all
    end

    def songs #has many songs
        Song.all.select {|song| song.genre == self}
    end

    def artists #has many artists, through songs
        Artist.all.select {|artist| artist.songs == self}
    end

    def artists
        self.songs.map {|song| song.artist}
    end
    
end