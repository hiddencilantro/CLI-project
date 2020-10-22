class CLI

    def run
        puts "Welcome to the Premier League CLI Application!"
        sleep(0.5)
        puts "Loading football data... Please wait."
        Scraper.new.initial_scrape
        puts "Done."
        sleep(0.5)
        puts "Enter the number you'd like to view."
        puts ""
        puts "1. List of all Premier League clubs"
        puts "2. Current league standings"
        while user_input = gets.chomp
            case user_input
            when "1"
                Club.print_all_clubs
                break
            when "2"
                League.print_league_standings
                break
            else
                puts "Invalid entry. Please try again."
            end
        end

    end

end
