require "arabic_roman_converter"

RSpec.describe ArabicRomanConverter do
  { 0 => "",
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    9 => "IX",
    10 => "X",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    3999 => "MMMCMXCIX",
  }.each do |arabic, roman|
    it "converts #{arabic} to #{roman}" do 
      expect(ArabicRomanConverter.convert(arabic)).to eq(roman)
    end
  end
end
