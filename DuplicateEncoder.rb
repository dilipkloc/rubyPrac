def duplicateFind(word)
  returnString = ""
  word = word.downcase
  word1 = word.split("")
  word1.each do |str|
    if (word.downcase.count str) > 1
        returnString+=")"
    else
        returnString+="("
    end
  end
  returnString
end

puts duplicateFind("Success");