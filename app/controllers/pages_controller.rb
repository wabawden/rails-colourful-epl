require 'faraday'
require 'json'

class PagesController < ApplicationController
  def home
    response = Faraday.new('http://api.football-data.org/v2/competitions/2021/standings', headers: { 'X-Auth-Token' => '8ca89bfab8d54a1e93329e2239d4a6a0' }).get
    teams = []
    table = []
    @table = JSON.parse(response.body)["standings"][0]["table"]
    JSON.parse(response.body)["standings"][0]["table"].each do |team|
      table << team["team"]["name"]
    end
    @teams = teams
  end
  def getsquad(id)
    club_id = id
    doc = Nokogiri::HTML(URI.open("https://soccerwiki.org/squad.php?clubid=#{club_id}"))
    squad = []
    doc.css('table.sortable-onload-4-6r').each do |link|
      link.children.each do |child|
        squad << child.children[3].children.first.children.first.content if child.name == "tr" && child.children[3].children.first.children.first
      end
    end
  end
end

class String

  def names(team)
    case team
    when "Arsenal FC" then "Arsenal"
    when "Leicester City FC" then "Leicester"
    when "Chelsea FC" then "Chelsea"
    when "Wolverhampton Wanderers FC" then "Wolves"
    when "Liverpool FC" then "Liverpool"
    when "Newcastle United FC" then "Newcastle"
    when "Everton FC" then "Everton"
    when "Crystal Palace FC" then "Palace"
    when "Aston Villa FC" then "Villa"
    when "Manchester City FC" then "Man City"
    when "Manchester United FC" then "Man Utd"
    when "Burnley FC" then "Burnley"
    when "Leeds United FC" then "Leeds"
    when "Tottenham Hotspur FC" then "Spurs"
    when "Southampton FC" then "Southampton"
    when "Brighton & Hove Albion FC" then "Brighton"
    when "Sheffield United FC" then "Sheffield Utd"
    when "West Ham United FC" then "West Ham"
    when "Fulham FC" then "Fulham"
    when "West Bromwich Albion FC" then "West Brom"
    end
  end

  def classname(team)
    case team
    when "Arsenal FC" then "arsenal"
    when "Leicester City FC" then "leicester"
    when "Chelsea FC" then "chelsea"
    when "Wolverhampton Wanderers FC" then "wolves"
    when "Liverpool FC" then "liverpool"
    when "Newcastle United FC" then "newcastle"
    when "Everton FC" then "everton"
    when "Crystal Palace FC" then "palace"
    when "Aston Villa FC" then "villa"
    when "Manchester City FC" then "mancity"
    when "Manchester United FC" then "manutd"
    when "Burnley FC" then "burnley"
    when "Leeds United FC" then "leeds"
    when "Tottenham Hotspur FC" then "spurs"
    when "Southampton FC" then "southampton"
    when "Brighton & Hove Albion FC" then "brighton"
    when "Sheffield United FC" then "sheffutd"
    when "West Ham United FC" then "westham"
    when "Fulham FC" then "fulham"
    when "West Bromwich Albion FC" then "westbrom"
    end
  end

  def wiki_id(team)
    case team
    when "Arsenal FC" then 1
    end
  end
end










