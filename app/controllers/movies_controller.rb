class MoviesController < ApplicationController
  def index
    @query = params[:query]
    @movies = Movie.top10 if @query.nil? || @query.empty?    
    @movies = Movie.filter(parse(@query), params[:page].nil? ? 1 : params[:page].to_i) unless @query.nil? || @query.empty?
    @incomplete = Movie.incomplete
  end

  def show
    @movie = Movie.get(params[:id])
  end
  
  private
  def parse(query)
    hash = {}
    
    query.scan(/([a-z]+): ([\S]+)|([a-zA-Z]+)/).each do |match|
      
      hash.merge!({get_key(match[0]) => "%#{match[1]}%"}) unless match[0].nil? && match[1].nil?
      hash.merge!({"title.like" => "%#{match[2]}%"}) unless match[2].nil?
      
    end
    
    hash.empty? ? {"title.like" => query} : hash
  end
  
  def get_key(key)
    return "#{key}s.name.like" if key == "director" || key == "writer"
    return "#{key}s.description.like" if key == "genre"
    return "#{key}.like" if key == "year"
  end
end
