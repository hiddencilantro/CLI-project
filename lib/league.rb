class League

    @@all = []

    attr_accessor :position, :club_name, :matches_played, :matches_won, :matches_drawn, :matches_lost, :goals_for, :goals_against, :goal_diff, :points

    def initialize(position, club_name, matches_played, matches_won, matches_drawn, matches_lost, goals_for, goals_against, goal_diff, points)
        @position = position
        @club_name = club_name
        @matches_played = matches_played
        @matches_won = matches_won
        @matches_drawn = matches_drawn
        @matches_lost = matches_lost
        @goals_for = goals_for
        @goals_against = goals_against
        @goal_diff = goal_diff
        @points = points
        self.class.all << self
    end

    def self.all
        @@all
    end

end
