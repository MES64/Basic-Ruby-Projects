def caesar_cipher(input_string, shift)
  input_string
end

puts "Please enter an input string and shift number:"
input_string = gets.chomp
shift = gets.chomp.to_i

output_string = caesar_cipher(input_string, shift)
puts "The modified string is: #{output_string}"