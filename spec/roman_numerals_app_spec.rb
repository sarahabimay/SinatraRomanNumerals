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

  it "converts 0 to ''" do
    put "/convert?arabic=0"
    expect(last_response.body).to include("Arabic: 0 == Roman:")
    expect(last_response.body).to include("Again?")
  end

  it "converts 1 to II" do
    put "/convert?arabic=1"
    expect(last_response.body).to include("Arabic: 1 == Roman: I")
    expect(last_response.body).to include("Again?")
  end
end
