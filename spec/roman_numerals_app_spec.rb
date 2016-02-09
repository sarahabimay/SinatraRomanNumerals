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
end
