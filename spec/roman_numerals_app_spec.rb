ENV["RACK_ENV"] = "test"

require "roman_numerals_app"  # <-- your sinatra app
require "rspec"
require "rack/test"

RSpec.describe RomanNumeralsApp do
  include Rack::Test::Methods

  def app
    RomanNumeralsApp
  end

  it "displays greeting" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("Roman Numerals Kata")
    expect(last_response.body).to include("Arabic Number to Convert")
    expect(last_response.body).to include("Convert To Roman")
  end

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
      put "/convert?arabic=#{arabic}"
      expect(last_response.body).to include("Arabic: #{arabic} == Roman: #{roman}")
      expect(last_response.body).to include("Again?")
    end
  end

end
