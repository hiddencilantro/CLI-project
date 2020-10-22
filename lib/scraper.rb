class Scraper

    def initialize
        @base_url = "https://www.premierleague.com"
    end

    def initial_scrape
        html = open(@base_url + "/tables")
        html_parsed = Nokogiri::HTML(html)
        clubs = html_parsed.css('.tableBodyContainer.isPL').css('tr:not(.expandable)')
        # @league = html_parsed.css('.tabbedContent').css('.current').text

        clubs.each do |club|
            name = club.css('.long').text
            position = club.css('.value').text
            matches_played = club.css('td')[3].text
            matches_won = club.css('td')[4].text
            matches_drawn = club.css('td')[5].text
            matches_lost = club.css('td')[6].text
            goals_for = club.css('td')[7].text
            goals_against = club.css('td')[8].text
            goal_diff = club.css('td')[9].text.strip
            points = club.css('td')[10].text

            @club_url = club.css('.team').css('a').attribute('href').value
            club_html = open(@base_url + @club_url)
            club_html_parsed = Nokogiri::HTML(club_html)
            squad_url = club_html_parsed.css('.heroPageLinks').css('li')[1].css('a').attribute('href').value
            # squad_info = self.secondary_scrape(squad_url)

            # players = Player.new(player_number, player_name, player_position)
            # league = League.find_or_create_by_name(@league)
            club = Club.new(name, league, position, matches_played, matches_won, matches_drawn, matches_lost, goals_for, goals_against, goal_diff, points)

        end
    end

    def secondary_scrape(squad_url)
        squad_html = open(@base_url + @club_url.delete_suffix("overview") + squad_url)
        squad_html_parsed = Nokogiri::HTML(squad_html)
        squad = squad_html_parsed.css('.squadListContainer').css('.squadPlayerHeader')

        squad.each do |player|
            player_number = player.css('.number').text
            player_name = player.css('.name').text
            player_position = player.css('.position').text
        end
    end

end



# results_url = club_html_parsed.css('.heroPageLinks').css('li')[3].css('a').attribute('href').value
# results_html = open(BASE_URL + club_url.delete_suffix("overview") + results_url)
# results_html_parsed = Nokogiri::HTML(results_html)
# results = results_html_parsed.css('.fixtures')
# results_date = results.css('.date.long').text



# BASE_URL = "https://www.tottenhamhotspur.com"

# url = "https://www.tottenhamhotspur.com/teams/first-team/players/"
# html = open(url)
# html_parsed = Nokogiri::HTML(html)
# players = html_parsed.css('.PlayersPlayer')

# players.each do |player|
#     number = player.css('.PlayersPlayer__number').text
#     name = player.css('.PlayersPlayer__name').text
#     hometown = player.css('.PlayersPlayer__country').text

#     player_detail_url = player.attr("href")
#     player_detail_html = open(BASE_URL + player_detail_url)
#     player_detail_html_parsed = Nokogiri::HTML(player_detail_html)
#     birthdate = player_detail_html_parsed.css('.no-spacing').text

#     player_detail_multiple_text = player_detail_html_parsed.css('.rte')[0]
#     player_detail_divided_text1 = player_detail_multiple_text.css('p')[0].text
#     player_detail_divided_text2 = player_detail_multiple_text.css('p')[1].text
#     # player_detail_divided_text3 = player_detail_multiple_text.css('p')[2].text

#     Player.new(number, name, hometown, birthdate, player_detail_divided_text1, player_detail_divided_text2)

#     puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
#     puts "Player Number: #{number}"
#     puts "Player Name: #{name}"
#     puts "Player Hometown: #{hometown}"
#     puts ""
#     puts "Player Info:"
#     puts ""
#     puts birthdate
#     puts ""
#     puts player_detail_divided_text1
#     puts player_detail_divided_text2
#     # puts player_detail_divided_text3
#     puts ""
# end

