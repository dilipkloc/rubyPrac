require 'nokogiri'
require 'open-uri'
require 'json'
require 'ostruct'
# URL = 'http://localhost:3000/'
URL = 'https://www.codewars.com/users/leaderboard'
def solution
  document = URI.open(URL)
content = document.read
parsed_content = Nokogiri::HTML(content, nil, 'UTF-8')
tr = parsed_content.css('tr')
a = {
    :position => []
}
tr.each_with_index do |i,index| 
    if i.css('td')[2].nil? #index == 0
      a[:position].push({
        @name => "",
        @clan => "",
        @honor => 0
      })
    else
      # p i.css('td')[2].inner_html
      a[:position].push(
          {
              :name => i.values[0].to_s,
              :clan => i.css('td')[2].inner_html.to_s,
              :honor => i.css('td')[3].inner_html.to_i
          })
    end
end
JSON.parse(a.to_json,object_class: OpenStruct)
end
# k = OpenStruct.new(solution)
k = solution#JSON.parse(solution,object_class: OpenStruct)
puts k.position[1].name