def caesar_cipher(input_string, shift_factor)
  input_characters = input_string.split("")
  p input_characters

  output_characters = input_characters.map do |character|
    if in_alphabet?(character)
      shift_letter(character, shift_factor)
    else
      character
    end
  end
  p output_characters

  input_string
end

def in_alphabet?(character)
  ("A".ord.."Z".ord).include?(character.ord) || ("a".ord.."z".ord).include?(character.ord)
end

def shift_letter(letter, shift_factor)
  letter
end

puts "Please enter an input string and shift factor:"
input_string = gets.chomp
shift_factor = gets.chomp.to_i

output_string = caesar_cipher(input_string, shift_factor)
puts "The modified string is: #{output_string}"