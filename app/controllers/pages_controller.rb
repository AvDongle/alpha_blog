require 'open-uri'
require 'json'

class PagesController < ApplicationController

  def home
    #json = JSON.parse(open("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC").read)
    @cliff = Array.new
    for i in 0..4
      json = JSON.parse(open("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC").read)
      @cliff.append(json['data']['image_url'])#['fixed_height']['url'])
    end
  end

  def about

  end
end
