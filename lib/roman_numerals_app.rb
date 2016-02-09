require "sinatra/base"
require "tilt/erb"

require "arabic_roman_converter"

class RomanNumeralsApp < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/../public'
  set :views, File.dirname(__FILE__) + '/../views'

  get '/' do
    erb :index
  end

  post '/convert' do
    @arabic = params['arabic']
    @roman = ArabicRomanConverter.convert(@arabic.to_i) 
    erb :convert 
  end
end
