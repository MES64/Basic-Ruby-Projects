def caesar_cipher(input_string, shift_factor)
  input_characters = input_string.split("")

  output_characters = input_characters.map do |character|
    if character.between?("a", "z")
      # ASCII value converted to range 0-25, shifted (wrap z-a), then converted back
      ((character.ord - "a".ord + shift_factor) % 26 + "a".ord).chr
    elsif character.between?("A", "Z")
      ((character.ord - "A".ord + shift_factor) % 26 + "A".ord).chr
    else
      character
    end
  end

  output_characters.join
end

puts "Please enter an input string and shift factor:"
input_string = gets.chomp
shift_factor = gets.chomp.to_i

output_string = caesar_cipher(input_string, shift_factor)
puts "The modified string is: #{output_string}"