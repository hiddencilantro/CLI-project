class CLI

    def run
        puts "Welcome to the Premier League CLI Application!"
        sleep(0.5)
        puts "Loading all football data... This may take a while..."
        Scraper.new.initial_scrape
        puts "Done."
        sleep(0.5)
        puts "Enter the number you'd like to see."
        puts ""
        puts "1. List of all Premier League clubs"
        puts "2. Current league standings"
        user_input = gets.chomp
        if user_input == "1"
            #code for 1
        elsif user_input == "2"
            #code for 2
        else
            #error
        end

    end

end