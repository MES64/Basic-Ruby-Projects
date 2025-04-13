# frozen_string_literal: true

# Caesar Cipher Class
class CaesarCipher
  attr_accessor :message

  def initialize(message = '')
    @message = message
  end

  def play
    update_message
    shift = verified_shift
    new_message = apply_shift(shift)
    output(new_message)
  end

  def update_message
    self.message = input('an input message')
  end

  def verified_shift
    loop do
      shift = input('an integer shift factor')
      return shift.to_i if shift.match?(/^-?\d+$/)

      puts 'Invalid input!'
    end
  end

  def apply_shift(shift)
    message.chars.map do |char|
      next char unless char.between?('a', 'z') || char.between?('A', 'Z')

      base_char = char.between?('a', 'z') ? 'a' : 'A'
      shift_char(char, shift, base_char)
    end.join
  end

  private

  def shift_char(char, shift_factor, base_char)
    # ASCII value converted to range 0-25, shifted (wrap z-a), then converted back
    (((char.ord - base_char.ord + shift_factor) % 26) + base_char.ord).chr
  end

  def input(prompt)
    puts "Please enter #{prompt}:"
    gets.chomp
  end

  def output(new_message)
    puts "The modified string is: #{new_message}"
  end
end
