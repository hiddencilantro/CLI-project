class CLI

    def run
        puts ""
        puts "Welcome to the Premier League CLI Application!".light_blue
        puts ""
        sleep(0.5)
        puts "Loading football data... Please wait...".light_yellow
        puts ""
        Scraper.new.initial_scrape
        puts "Ready!".green
        sleep(0.5)
        main_menu
    end

    def user_input
        print "Premier League >> "
        user_input = gets.chomp
    end

    def main_menu
        puts ""
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
            Club.print_league_standings
            league_standings_menu
        when "3"
            goodbye
        else
            invalid_entry
            main_menu
        end
    end

    def list_of_clubs
        Club.print_all_clubs
        list_of_clubs_menu
    end

    def list_of_clubs_menu
        puts ""
        puts "Select a club number to view the squad"
        puts "Enter '0' to return to the main menu"
        puts ""
        case user_input
        when "0"
            main_menu
        when ('1'..'20')
            input_to_index = user_input.to_i - 1
            Player.all.select do |player| 
                if player.club == Club.all[input_to_index]
                    player.print_player
                    sleep(0.1)
                end
            end
            view_players_menu
        else
            invalid_entry
            list_of_clubs_menu
        end
    end

    def view_players_menu
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
            view_players_menu
        end
    end

    def league_standings_menu
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
            league_standings_menu
        end
    end

    def invalid_entry
        puts ""
        puts "Invalid entry. Please try again.".red
    end

    def goodbye
        puts "Thanks for using the Premier League CLI Application! Goodbye!".light_green
        exit!
    end
end
