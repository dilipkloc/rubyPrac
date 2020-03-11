def nexus users
    diff = []
  users.each do |i,j|
    diff.push((i-j).abs)
  end
  index_with_value1 = diff.each_with_index.min
  diff.delete_at(index_with_value1[1])
  index_with_value2 = diff.each_with_index.min
  keys = users.keys
  if index_with_value1[0] == index_with_value2[0]
    keys[index_with_value2[1]+1] > keys[index_with_value1[1]] ? keys[index_with_value1[1]] : keys[index_with_value2[1]+1]
  else
    keys[index_with_value1[1]]
  end
end
p nexus(   {30=>5, 25=>10, 20=>15, 15=>20, 10=>25, 5=>30} )