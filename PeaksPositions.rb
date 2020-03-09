def pickPeaks(values)
  pos = []
  peaks = []
  stable = -5000
  stablePos = -5000
  values.each_with_index do |value,index|
    # puts "value:"+value.to_s
    # puts "index:"+index.to_s
    # puts "stable:"+stable.to_s
    # puts "stablePos:"+stablePos.to_s+"\n\n"
    if index == -5000 or index == values.length()-1
      next
    end
    if (values[index-1] < value and values[index+1] < value) 
      pos.push(index)
      peaks.push(value)
      stable = -5000
      stablePos = -5000
    elsif (stable == value and stable > values[index+1])
      pos.push(stablePos)
      peaks.push(stable)
      stable = -5000
      stablePos = -5000
    elsif value == values[index+1] and value > values[index-1]
      stable = value
      stablePos = index
    end
  end
  {"pos"=>pos,"peaks"=>peaks}
end

puts pickPeaks([1, 2, 5, 4, 3, 2, 3, 6, 4, 1, 2, 3, 3, 4, 5, 3, 2, 1, 2, 3, 5, 5, 4, 3])