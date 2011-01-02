namespace :movies do
	desc "Search movies using the movie provider by query."	
	task :search, [:query] => :environment do |t,args|
	  provider = Thoth.new
	  movie = Movie.create!({:download_name => args.query, :complete => false})
	  movies = provider.search(args.query)
	  
	  if( 1 == movies.select{|m| !m["imdbid"].nil?}.count)
    
    end
	  #puts movies
	  #puts movies.select{|m| !m["imdbid"].nil?}.count
	  #TODO: Incluir codico para veirifcar se o filme foi encontrado e salva-lo no banco.
	end
	
	desc "Search for movie using the movie provider by imdbid."	
	task :get, [:imdbid] => :environment do |t,args|
    
	  provider = Thoth.new
	  movie = provider.get_movie(args.imdbid)
	  if(movie["error"].nil?)
	    m = Movie.first_or_create({:imdbid => args.imdbid})
	    m.update_from(movie)
      puts "Movie #{m.title} saved!"
    else
      puts "Movie not saved!"
    end
	end
	
	desc "Load movies from hash."
	task :load => :environment do
	  not_saved = []
    [["The 13TH Warrior","tt0120657"],["A Fish Called Wanda","tt0095159"],["Sin City","tt0401792"],["Airplane!","tt0080339"],["Happy Feet","tt0366548"]].each do |i|
      puts i[0]
      Rake::Task["movies:get"].reenable
      Rake::Task["movies:get"].invoke(i[1])
      not_saved.push("#{i[1]} - #{i[0]}") if Movie.get(i[1]).nil?
    end
    
    not_saved.each do |a|
      puts a
    end
  end
end
