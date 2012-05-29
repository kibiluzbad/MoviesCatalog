require 'sinatra'

# GET /movies
get '/movies' do  
  # return a list of movies
  "Teste"
end

# POST /movies
get '/movies/new' do  
  # create movies from name, can be a single name or a array of names
  "Teste"
end

# DELETE /movies
get '/movies' do  
  # delete movies from name, can be a single name or a array of names
  "Teste"
end

# GET /movies/[:id]
get  %r{/movies/(tt[0-9]+)} do  
  # show movie details
  "Teste"
end
