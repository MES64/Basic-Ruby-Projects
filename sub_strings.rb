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
test3 = substrings("below", [])
test4 = substrings("below", dictionary.map(&:upcase))
test5 = substrings("BELOW", dictionary.map(&:upcase))
test6 = substrings("", dictionary)

puts "dictionary = #{dictionary}"

puts "Test for single word in string:"
puts "substrings('below', dictionary) outputs: #{test1}"
puts "Correct: #{test1 == { "below" => 1, "low" => 1 }}"

puts "Test for multiple words in string with uppercase letters too:"
puts "substrings('Howdy partner, sit down! How's it going?', dictionary) outputs: #{test2}"
puts "Correct: #{test2 == { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }}"

puts "Test for empty dictionary:"
puts "substrings('below', []) outputs: #{test3}"
puts "Correct: #{test3 == {}}"

puts "Test for uppercase letters in dictionary:"
puts "substrings('below', dictionary.map(&:upcase)) outputs: #{test4}"
puts "Correct: #{test4 == { "BELOW" => 1, "LOW" => 1 }}"

puts "Test for both string and dictionary containing uppercase letters:"
puts "substrings('BELOW', dictionary.map(&:upcase)) outputs: #{test5}"
puts "Correct: #{test5 == { "BELOW" => 1, "LOW" => 1 }}"

puts "Test for empty string:"
puts "substrings('', dictionary) outputs: #{test6}"
puts "Correct: #{test6 == {}}"