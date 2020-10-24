class Scraper

    def initialize
        @base_url = "https://www.premierleague.com"
    end

    def initial_scrape
        html = open(@base_url + "/tables")
        html_parsed = Nokogiri::HTML(html)
        get_clubs = html_parsed.css('.tableBodyContainer.isPL').css('tr:not(.expandable)')

        get_clubs.each do |club|
            name = club.css('.long').text
            league_name = "Premier League"
            position = club.css('.value').text
            matches_played = club.css('td')[3].text
            matches_won = club.css('td')[4].text
            matches_drawn = club.css('td')[5].text
            matches_lost = club.css('td')[6].text
            goals_for = club.css('td')[7].text
            goals_against = club.css('td')[8].text
            goal_diff = club.css('td')[9].text.strip
            points = club.css('td')[10].text

            league = League.find_or_create_by_name(league_name)
            @new_club = Club.new(name, league, position, matches_played, matches_won, matches_drawn, matches_lost, goals_for, goals_against, goal_diff, points)

            @club_url = club.css('.team').css('a').attribute('href').value
            club_html = open(@base_url + @club_url)
            club_html_parsed = Nokogiri::HTML(club_html)
            squad_url = club_html_parsed.css('.heroPageLinks').css('li')[1].css('a').attribute('href').value
            self.secondary_scrape(squad_url)
        end
    end

    def secondary_scrape(squad_url)
        squad_html = open(@base_url + @club_url.delete_suffix("overview") + squad_url)
        squad_html_parsed = Nokogiri::HTML(squad_html)
        get_squad = squad_html_parsed.css('.playerCardInfo')

        get_squad.each do |player|
            player_number = player.css('.number').text
            player_name = player.css('.name').text
            player_position = player.css('.position').text

            Player.new(@new_club, player_number, player_name, player_position)
        end
    end

end
