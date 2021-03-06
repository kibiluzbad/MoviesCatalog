class MoviesController < ApplicationController
  include MoviesService

  def index
    @query = params[:query]
    @movies = Movie.top10 if @query.nil? || @query.empty?    
    @movies = Movie.filter(parse(@query), params[:page].nil? ? 1 : params[:page].to_i) unless @query.nil? || @query.empty?
    @incomplete = Movie.incomplete
    
    if request.xhr?
      render :partial => @movies
    end
  end

  def show
    @movie = Movie.get(params[:id])
  end
  
  def create
    create_movies params["names"] if params["names"]
    search_by_name params["name"] if params["name"]
    render :layout => false, :json => {:result => "success"}
  end
  
  def destroy
  	raise "No name to delete was informed." unless params[:name]
  	
  	movie = Movie.first_by_downloaded_name(params[:name])
    movie.destroy if movie
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

  def create_movies(movies = [])
    movies.each{|m| search_by_name m }
  end
end
