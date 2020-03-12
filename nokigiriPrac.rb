require 'nokogiri'
require 'open-uri'
require 'json'
# require_relative './forTest'
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
    if index == 0 #i.css('td')[2].nil? 
      a[:position].push({
        :name => "",
        :clan => "",
        :honor => 0
      })
    else
      a[:position].push(
          # {
          #     :name => i.values[0].to_s,
          #     :clan => i.css('td')[2].inner_html.to_s,
          #     :honor => i.css('td')[3].inner_html.to_i
          # }
          # User.new(i.values[0].to_s,i.css('td')[2].inner_html.to_s,i.css('td')[3].inner_html.to_i).test
          User.new(i.attr('data-username'),i.css('td')[2].inner_html.to_s,i.css('td')[3].inner_html.split(',').join().to_i).test
          )
    end
  end
  JSON.parse(a.to_json,object_class: OpenStruct)
end

class User
  attr_accessor :name,:clan,:honor,:temp
  def initialize(name,clan,honor)
    @clan = clan
    @honor = honor
    @name = name
  end

  def test
    JSON.parse({ 
      :name => @name, 
      :clan => @clan, 
      :honor => @honor
  }.to_json)
  end
end


p solution.position[1].honor
p solution.position[2].honor
p solution.position[3].honor
p solution.position[4].honor
p solution.position[5].honor
# p solution.position[3].name

