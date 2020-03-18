require 'rubygems'
require 'httparty'

class Test
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'
  def posts
    self.class.get('/posts');
  end
end

test = Test.new
response = test.posts



# puts response
response.each do |value|
    value.each do |key,value1|
        p = key.to_s+":"+value1.to_s+"\t"
        puts p
    end
    puts "\n\n"
end
# puts response.is_a?(Object)
# response.each(|key, value|)