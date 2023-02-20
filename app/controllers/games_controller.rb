require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def start
    @letters = Array('A'..'Z').sample(10)
  end

  def score
    # raise
    #URI.open
    #url de l'api + /@input
    #parser json
    @input = params[:word]
    # .read recupere le body direct si besoin de choses spécifiques alors bloc {} après orpen
    result = URI.open("https://wagon-dictionary.herokuapp.com/#{@input}").read # string : "{\"found\":false,\"word\":\"zzzzz\",\"error\":\"word not found\"}"
    parsed_response = JSON.parse(result) # {} {"found"=>false, "word"=>"zzzzz", "error"=>"word not found"}
    exist = parsed_response['found'] # false
    word = parsed_response['word']

    if exist == false
      @a = "Sorry but #{@input} does not exist and cannot be built"
    end
  end
end
