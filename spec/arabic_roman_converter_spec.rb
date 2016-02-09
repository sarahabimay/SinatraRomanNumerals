require "arabic_roman_converter"

RSpec.describe ArabicRomanConverter do
  it "converts 0 to ''" do 
    expect(ArabicRomanConverter.convert(0)).to eq('')
  end
end
