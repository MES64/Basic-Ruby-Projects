def substrings(string, dictionary)
  dictionary.reduce({}) do |sub_strings, word|
    times_found = string.downcase.scan(word.downcase).length
    sub_strings[word] = times_found if times_found > 0
    sub_strings
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
test1 = substrings("below", dictionary)
test2 = substrings("Howdy partner, sit down! How's it going?", dictionary)

puts "dictionary = #{dictionary}"
puts "substrings('below', dictionary) outputs: #{test1}"
puts "Correct: #{test1 == { "below" => 1, "low" => 1 }}"
puts "substrings('Howdy partner, sit down! How's it going?', dictionary) outputs: #{test2}"
puts "Correct: #{test2 == { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }}"