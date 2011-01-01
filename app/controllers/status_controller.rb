class StatusController < ApplicationController
  def index
    @status ={:directors => Director.count, :movies => Movie.count, :genres => Genre.count, :writers => Writer.count }
  end

end
