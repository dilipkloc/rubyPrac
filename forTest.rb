require 'json'
require 'pry'
require 'nokogiri'
require 'open-uri'
class Parser
    URL = 'https://www.codewars.com/users/leaderboard'.freeze
    def initialize
      @content = Nokogiri::HTML(open(URL), nil, 'UTF-8')
    end
    def rows
      @rows ||= @content.css('table').css('tr')[1..500]
    end
end
class User
    attr_reader :name, :clan, :honor
    def initialize(name:, clan:, honor:)
      @name, @clan, @honor = name, clan, honor
    end
  end
class Leaderboard
    def initialize
      @parser = Parser.new
    end
    def position
      @position= prepare_users
    end
    private
    attr_reader :parser
    def prepare_users
      users = []
      parser.rows.each do |row|
        users.push(
          User.new(
            name: row['data-username'],
            clan: row.css('td')[2].text,
            honor: row.css('td').last.text
          )
        )
      end
      return users
    end
  end

#   p User.new('asha','yerume',12).test