require 'open-uri'
require 'json'

class PagesController < ApplicationController

  def home
    json = JSON.parse(open("http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC").read)
    @num = json['data'].count
    @cliff = Array.new
    for i in 0..4
      @cliff.append(json['data'][rand(@num)]['images']['fixed_height']['url'])
    end
  end

  def about

  end
end
