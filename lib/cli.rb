class CLI

    def run
        puts "Welcome to the Premier League CLI Application!"
        sleep(0.5)
        puts "Loading football data... Please wait..."
        Scraper.new.initial_scrape
        puts "Done."
        sleep(0.5)
        puts "Enter the number you'd like to see."
        puts ""
        puts "1. List of all Premier League clubs"
        puts "2. Current league standings"
        while user_input = gets.chomp
            case user_input
            when "1"
                Club.print_all_clubs
                puts "Enter a club number to view the squad"
                club_selection = gets.chomp
                selection_to_index = club_selection.to_i - 1
                Player.all.select do |player| 
                    if player.club == Club.all[selection_to_index]
                        player.print_player
                        sleep(0.1)
                    end
                end
                break
            when "2"
                Club.print_league_standings
                break
            else
                puts "Invalid entry. Please try again."
            end
        end

    end

end
