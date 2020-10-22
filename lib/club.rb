class Club

    @@all = []

    attr_accessor :name, :league, :position, :matches_played, :matches_won, :matches_drawn, :matches_lost, :goals_for, :goals_against, :goal_diff, :points

    def initialize(name, league, position, matches_played, matches_won, matches_drawn, matches_lost, goals_for, goals_against, goal_diff, points)
        @name = name
        @league = league
        @position = position
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

    def print_standings
        puts "========================================================"
        puts "#{self.position}  #{self.name}"
        puts ""
        puts "Played: #{self.matches_played} / Won: #{self.matches_won} / Drawn: #{self.matches_drawn} / Lost: #{self.matches_lost} / Points: #{self.points}"
        puts "Goals For: #{self.goals_for} / Goals Against: #{self.goals_against} / Goal Difference: #{self.goal_diff}"
        puts ""
    end

    def self.print_league_standings
        self.all.each do |club|
            club.print_standings
            sleep(0.2)
        end
    end

    def self.print_all_clubs
        self.all.each_with_index {|club, index| puts "#{index + 1}. #{club.name}"}
    end

end
