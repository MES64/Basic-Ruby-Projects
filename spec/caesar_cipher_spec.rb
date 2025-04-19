# frozen_string_literal: true

require_relative '../lib/caesar_cipher'

describe CaesarCipher do
  # Generic Getters/Setters -> No need to test, well tested in the Ruby library

  describe '#initialize' do
    # Initialize -> No need to test
  end

  describe '#play' do
    # Public Script Method -> No need to test but must test methods used
  end

  describe '#update_message' do
    # Located in #play (Public Script)
    # Command Message -> Test that message is updated
    subject(:cipher_update) { described_class.new }

    before do
      allow(cipher_update).to receive(:input).with('an input message').and_return('Hello, World!')
    end

    it 'sets message to value returned by #input' do
      cipher_update.update_message
      expect(cipher_update.message).to eql('Hello, World!')
    end
  end

  describe '#verified_shift' do
    # Located in #play (Public Script)
    # Query Message -> Test value returned
    subject(:cipher_verify) { described_class.new }

    context 'when the user enters a valid input' do
      before do
        valid_input = '5'
        allow(cipher_verify).to receive(:input).and_return(valid_input)
        allow(cipher_verify).to receive(:puts)
      end

      it 'returns the first input' do
        shift_one_attempt = cipher_verify.verified_shift
        expect(shift_one_attempt).to eql(5)
      end
    end

    context 'when the user enters an invalid input, then a valid input' do
      before do
        invalid_input = 'a'
        valid_input = '-5'
        allow(cipher_verify).to receive(:input).and_return(invalid_input, valid_input)
        allow(cipher_verify).to receive(:puts)
      end

      it 'returns the second input' do
        shift_two_attempts = cipher_verify.verified_shift
        expect(shift_two_attempts).to eql(-5)
      end
    end

    context 'when the user enters 2 invalid inputs, then a valid input' do
      before do
        invalid_decimal = '5.5'
        invalid_space = ' 5'
        valid_input = '10'
        allow(cipher_verify).to receive(:input).and_return(invalid_decimal, invalid_space, valid_input)
        allow(cipher_verify).to receive(:puts)
      end

      it 'returns the third input' do
        shift_three_attempts = cipher_verify.verified_shift
        expect(shift_three_attempts).to eql(10)
      end
    end
  end

  describe '#apply_shift' do
    # Located in #play (Public Script)
    # Query Message -> Test the return value

    context 'when the message is one word' do
      subject(:cipher_one_word) { described_class.new('Hello') }

      it 'works for small positive shift' do
        output_small_positive_shift = cipher_one_word.apply_shift(5)
        expect(output_small_positive_shift).to eql('Mjqqt')
      end

      it 'works for small negative shift' do
        output_small_negative_shift = cipher_one_word.apply_shift(-5)
        expect(output_small_negative_shift).to eql('Czggj')
      end

      it 'works for large positive shift' do
        output_large_positive_shift = cipher_one_word.apply_shift(55)
        expect(output_large_positive_shift).to eql('Khoor')
      end

      it 'works for large negative shift' do
        output_large_negative_shift = cipher_one_word.apply_shift(-55)
        expect(output_large_negative_shift).to eql('Ebiil')
      end
    end

    context 'when the message is contains a mixture of non-alphabetical characters' do
      subject(:cipher_mixture) { described_class.new('Hello, World!!!111') }

      it 'works for small positive shift' do
        output_small_positive_shift = cipher_mixture.apply_shift(5)
        expect(output_small_positive_shift).to eql('Mjqqt, Btwqi!!!111')
      end

      it 'works for small negative shift' do
        output_small_negative_shift = cipher_mixture.apply_shift(-5)
        expect(output_small_negative_shift).to eql('Czggj, Rjmgy!!!111')
      end

      it 'works for large positive shift' do
        output_large_positive_shift = cipher_mixture.apply_shift(55)
        expect(output_large_positive_shift).to eql('Khoor, Zruog!!!111')
      end

      it 'works for large negative shift' do
        output_large_negative_shift = cipher_mixture.apply_shift(-55)
        expect(output_large_negative_shift).to eql('Ebiil, Tloia!!!111')
      end
    end
  end

  # Private & puts/gets only Methods -> No need to test
end
