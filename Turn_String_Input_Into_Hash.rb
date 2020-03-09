def str_to_hash(str)
  str = str.split(",")
  returnValue = {}
  str.each do |values|
    value=values.to_s.strip
    # puts value.to_h
    value = value.split("=")
    returnValue[value[0].to_s] = value[1].to_i
    # returnValue[value[0]] : value[1].to_i
    # returnValue.store(value[0],value[1].to_i)
    # returnValue[:value[0]] << value[1].to_i
    # returnValue= {value[0]=>value[1].to_i}
    # returnValue.merge!(value[0]:value[1])
  end
  returnValue
end

puts str_to_hash("a=1, b=2, c=3, d=4");