def caesar_cipher(input_string, shift)
  input_characters = input_string.split("")
  p input_characters

  output_characters = input_characters.map do |character|
    original_number = character.ord
  end
  p output_characters

  input_string
end

puts "Please enter an input string and shift number:"
input_string = gets.chomp
shift = gets.chomp.to_i

output_string = caesar_cipher(input_string, shift)
puts "The modified string is: #{output_string}"