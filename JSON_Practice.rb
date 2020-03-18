require 'rubygems'
require 'httparty'

class Test
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'
  def get(method, id = -1)
    if id == -1
      self.class.get('/'+method);
    else
      self.class.get('/'+method+'/'+id);
    end
  end
end

# response = Test.new.get('posts')
# response = Test.new.get('comments')
# response = Test.new.get('comments',23.to_s)
# response = Test.new.get('albums')
# response = Test.new.get('photos')
# response = Test.new.get('todos')
response = Test.new.get('users')





File.open('file_json_complete.json', 'w') do |f|
  f.puts JSON.parse(response.to_json)
end




# Below is used to print in colsole(ignore below code)
# puts response
# response.each do |value|
#   p value
#   puts "\n\n"
#     # value.each do |key,value1|
#     #     p = key.to_s+":"+value1.to_s+"\t"
#     #     puts p
#     # end
#     # puts "\n\n"
# end
