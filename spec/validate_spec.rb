require 'validate'
NAME_RANGE=3..20
DIGIT=4
MIN = 'a' * NAME_RANGE.first # 3.times(a)
MAX = 'a' * NAME_RANGE.last # 20.times(a)
MIN_DOWN = 'a' * (NAME_RANGE.first - 1) # 19.times(a)
MAX_UP = 'a' * (NAME_RANGE.last + 1) # 21.times(a)
NUMBER = ('1' * DIGIT) # 4.times(1)
NUMBER_UP = ('1' * (DIGIT + 1)) # 5.times(1)

RSpec.describe Validate do
  let(:dummy_class) { Class.new { extend Validate } }

  context 'when an LENGTH of user input is CORRECT', positive: true do
    it 'when a value of an user input is in a range && complete min-boundary value' do
      user_input = dummy_class.length_valid?(MIN, NAME_RANGE)
      expect(user_input).to eq(nil) # :TODO why method always! return false or nil and never true
    end
    it 'when a value of an user input is less then max-boundary of value', positive: true do
      user_input = dummy_class.length_valid?(MAX, NAME_RANGE)
      expect(user_input).to eq(nil) # :TODO why method always! return false or nil and never true
    end
  end

  context 'when an LENGTH of user input is WRONG!', negative: true do
    it 'when a value of an user input is NOT in a range && less then min-boundary value' do
      user_input = dummy_class.length_valid?(MIN_DOWN, NAME_RANGE)
      expect(user_input).to eq('Wrong length!')
    end
    it 'when a value of an user input is more then max-boundary value', negative: true do
      user_input = dummy_class.length_valid?(MAX_UP, NAME_RANGE)
      expect(user_input).to eq('Wrong length!')
    end
  end

  context 'when an user input is a STRING' do
    it 'when an user input is string', positive: true do
      user_input = dummy_class.string?(MIN)
      expect(user_input).to eq(nil)
    end
    it 'when an user input is NOT string', negative: true do
      user_input = dummy_class.string?(NUMBER.to_i)
      expect(user_input).to eq('Value is not string')
    end
  end

  context 'when an user input  NUMBER' do
    it 'when an user input is number', positive: true do
      user_input = dummy_class.number?(Integer(NUMBER))
      expect(user_input).to eq(nil)
    end
    it 'when an user input is NOT number', negative: true do
      user_input = dummy_class.number?(MIN)
      expect(user_input).to eq('Value is not number')
    end
  end
end
