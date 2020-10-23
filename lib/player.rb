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
    
    def print_player
        puts "--------------------------------"
        puts "#{self.player_number}  #{self.player_name}"
        puts "#{self.player_position}"
    end

    def self.print_all_players
        self.all.each do |player|
            player.print_player
            # sleep(0.2)
        end
    end

end





    # def initialize(number, name, hometown, birthdate, player_detail_divided_text1, player_detail_divided_text2)
    #     @number = number
    #     @name = name
    #     @hometown = hometown
    #     @birthdate = birthdate
    #     @player_detail_divided_text1 = player_detail_divided_text1
    #     @player_detail_divided_text2 = player_detail_divided_text2
    #     # @player_detail_divided_text3 = player_detail_divided_text3
    # end