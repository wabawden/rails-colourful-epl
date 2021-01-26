require 'nokogiri'
require 'open-uri'

club_id = 1

doc = Nokogiri::HTML(URI.open("https://soccerwiki.org/squad.php?clubid=#{club_id}"))
squad = []
doc.css('table.sortable-onload-4-6r').each do |link|
  link.children.each do |child|
    squad << child.children[3].children.first.children.first.content if child.name == "tr" && child.children[3].children.first.children.first
  end
end

p squad
