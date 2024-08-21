def caesar_cipher(input_string, shift_factor)
  input_characters = input_string.split("")

  output_characters = input_characters.map do |character|
    if in_downcase_alphabet?(character)
      shift_letter(character, shift_factor, "a")
    elsif in_upcase_alphabet?(character)
      shift_letter(character, shift_factor, "A")
    else
      character
    end
  end

  output_characters.join
end

def in_downcase_alphabet?(character)
  ("a".ord.."z".ord).include?(character.ord)
end

def in_upcase_alphabet?(character)
  ("A".ord.."Z".ord).include?(character.ord)
end

def shift_letter(letter, shift_factor, a_or_A)
  number_representing_letter_from_0_to_25 = letter.ord - a_or_A.ord
  shifted_number = number_representing_letter_from_0_to_25 + shift_factor
  shifted_number_from_0_to_25 = shifted_number % 26
  shifted_letter = (shifted_number_from_0_to_25 + a_or_A.ord).chr
end

puts "Please enter an input string and shift factor:"
input_string = gets.chomp
shift_factor = gets.chomp.to_i

output_string = caesar_cipher(input_string, shift_factor)
puts "The modified string is: #{output_string}"