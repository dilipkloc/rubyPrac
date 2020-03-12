require 'json'
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

#   p User.new('asha','yerume',12).test