class MoviesController < ApplicationController
  def index
    @query = params[:query]
    @movies = Movie.top10 if @query.nil? || @query.empty?
    @movies = Movie.filter(@query) unless @query.nil? || @query.empty?
    @incomplete = Movie.incomplete
  end

  def show
    @movie = Movie.get(params[:id])
  end
end
