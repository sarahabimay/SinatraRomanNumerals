require "sinatra/base"
require "arabic_roman_converter"

class RomanNumeralsApp < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/../public'
  set :views, File.dirname(__FILE__) + '/../views'

  get '/' do
    erb :index
  end
end
