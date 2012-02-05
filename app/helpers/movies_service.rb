module MoviesService
  def search_by_name(name,provider = Thoth.new,log = Logger.new(STDOUT))
	  
	  movies = provider.search(name)
	  completed = movies.select{|m| !m["imdbid"].nil?}
    unique = completed.uniq{|m| m["imdbid"].to_s.strip!}
	
	  if( 1 == unique.count)
      create_movie(unique.first["imdbid"],provider,log)
    else
      Movie.create!({:download_name => name, :complete => false})
    end

  end

  def create_movie(imdbid, provider = Thoth.new,log = Logger.new(STDOUT))    

	  movie = provider.get_movie(imdbid)
	  if(movie["error"].nil?)
	    m = Movie.first_or_create({:imdbid => imdbid})
	    m.update_from(movie)
      log.info "Movie #{m.title} saved!"
    else
      log.info "Movie not saved!"
    end

  end
end
