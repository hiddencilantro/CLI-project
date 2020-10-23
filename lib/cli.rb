class CLI

    def run
        puts "Welcome to the Premier League CLI Application!".light_blue
        sleep(0.5)
        puts "Loading football data... Please wait...".light_yellow
        Scraper.new.initial_scrape
        puts "Ready!".green
        sleep(0.5)
        puts ""
        main_menu
    end

    def user_input
        print "Premier League >> "
        user_input = gets.chomp
    end

    def main_menu
        puts "Enter the number you'd like to see"
        puts ""
        puts "1. List of all Premier League clubs".light_cyan
        puts "2. Current league standings".light_cyan
        puts "3. Exit program".light_cyan
        puts ""
        case user_input
        when "1"
            list_of_clubs
        when "2"
            league_standings
        when "3"
            goodbye
        else
            invalid_entry
        end
    end

    def list_of_clubs
        Club.print_all_clubs
        puts ""
        puts "Select a club number to view the squad"
        puts "Enter '0' to return to the main menu"
        puts ""
        case user_input.to_i
        when 0
            main_menu
        when (1..20)
            view_players
        else
            invalid_entry
        end
    end

    def view_players
        input_to_index = user_input.to_i - 1
        Player.all.select do |player| 
            if player.club == Club.all[input_to_index]
                player.print_player
                sleep(0.1)
            end
        end
        puts ""
        puts "Enter '0' to return to the main menu"
        puts "Enter '1' to view other clubs"
        puts "Enter '2' to exit the program"
        puts ""
        case user_input
        when "0"
            main_menu
        when "1"
            list_of_clubs
        when "2"
            goodbye
        else
            invalid_entry
        end
    end

    def league_standings
        Club.print_league_standings
        puts ""
        puts "Enter '0' to return to the main menu"
        puts "Enter '1' to exit the program"
        puts ""
        case user_input
        when "0"
            main_menu
        when "1"
            goodbye
        else
            invalid_entry
        end
    end

    def invalid_entry
        puts ""
        puts "Invalid entry. Please try again.".red
        puts ""
    end

    def goodbye
        puts "Thanks for using the Premier League CLI Application! Goodbye!".light_green
        exit!
    end
end
