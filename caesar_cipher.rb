# frozen_string_literal: true

def caesar_cipher(input_string, shift_factor)
  output_characters = input_string.chars.map do |character|
    if character.between?('a', 'z')
      shift_character(character, shift_factor, 'a')
    elsif character.between?('A', 'Z')
      shift_character(character, shift_factor, 'A')
    else
      character
    end
  end

  output_characters.join
end

def shift_character(character, shift_factor, char_a)
  # ASCII value converted to range 0-25, shifted (wrap z-a), then converted back
  (((character.ord - char_a.ord + shift_factor) % 26) + char_a.ord).chr
end

puts 'Please enter an input string and shift factor:'
input_string = gets.chomp
shift_factor = gets.chomp.to_i

output_string = caesar_cipher(input_string, shift_factor)
puts "The modified string is: #{output_string}"
