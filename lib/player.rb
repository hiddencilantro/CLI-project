class Player

    @@all = []

    attr_accessor :club, :player_number, :player_name, :player_position

    def initialize(club, player_number, player_name, player_position)
        @club = club
        @player_number = player_number
        @player_name = player_name
        @player_position = player_position
        self.class.all << self
    end

    def self.all
        @@all
    end

    def clubs
        Club.all.select {|club| club.name == self.club}
    end

    def league
        League.all.select {|league| league.players == self}
    end
    
    def print_player
        puts "--------------------------------"
        puts "#{self.player_number} #{self.player_name}"
        puts "#{self.player_position}"
    end

end
