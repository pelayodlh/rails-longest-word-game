require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.sample(10)
  end

  def score
    @guess = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
    word_result = URI.open(url).read
    @solution = JSON.parse(word_result)["found"]
    @solution_view = ""

    if @solution == true && @guess == @letters
      return @solution_view = "#{@guess.capitalize} was correct!"
    else
      return @solution_view = "The word was not correct!"
    end
  end
end


#fetch("https://wagon-dictionary.herokuapp.com/#{@guess}", {
 # method: 'POST',
 # headers: { "Content-Type": "application/json" },
 # body: JSON.stringify(@guess)
# })
# .then(response => response.json())
# .then((data) => {
 # console.log(data);
# });
