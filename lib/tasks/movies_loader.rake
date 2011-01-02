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
    ["tt0057413", "tt0058586", "tt0062622", "tt0063415", "tt0064276", "tt0066921", "tt0067927", "tt0070034", "tt0075066", "tt0076759", "tt0078748", "tt0080339", "tt0080684", "tt0083530", "tt0083658", "tt0086190", "tt0090728", "tt0091042", "tt0093058", "tt0095159", "tt0103064", "tt0107048", "tt0110148", "tt0110912", "tt0113568", "tt0114746", "tt0116367", "tt0116409", "tt0119822", "tt0120657", "tt0120737", "tt0120915", "tt0121765", "tt0121766", "tt0129387", "tt0133093", "tt0134847", "tt0137523", "tt0167260", "tt0167261", "tt0169547", "tt0203009", "tt0209144", "tt0234215", "tt0241527", "tt0242653", "tt0259711", "tt0266697", "tt0295297", "tt0304141", "tt0318462", "tt0319061", "tt0325980", "tt0330373", "tt0338013", "tt0351459", "tt0360717", "tt0361748", "tt0366548", "tt0371724", "tt0371746", "tt0373889", "tt0378194", "tt0383574", "tt0401792", "tt0407887", "tt0408236", "tt0409459", "tt0410297", "tt0411477", "tt0416320", "tt0417741", "tt0419706", "tt0420223", "tt0425123", "tt0427944", "tt0434409", "tt0435761", "tt0438488", "tt0441773", "tt0445922", "tt0446029", "tt0449059", "tt0449088", "tt0451079", "tt0457400", "tt0458525", "tt0468569", "tt0473075", "tt0479884", "tt0479952", "tt0482603", "tt0486655", "tt0489458", "tt0499549", "tt0499603", "tt0758758", "tt0780653", "tt0796366", "tt0800320", "tt0808151", "tt0814255", "tt0815245", "tt0830515", "tt0857355", "tt0859163", "tt0861739", "tt0865556", "tt0887883", "tt0887912", "tt0889583", "tt0890870", "tt0891592", "tt0892769", "tt0938283", "tt0942385", "tt0955308", "tt0960144", "tt0963966", "tt0970416", "tt0971209", "tt0985694", "tt0986263", "tt0988045", "tt1013752", "tt1014759", "tt1020885", "tt1028528", "tt1028532", "tt1034032", "tt1034331", "tt1037705", "tt1038686", "tt1039960", "tt1045772", "tt1045778", "tt1046173", "tt1049413", "tt1053424", "tt1055369", "tt1068678", "tt1068680", "tt1075747", "tt1080016", "tt1098327", "tt1099212", "tt1121931", "tt1125849", "tt1129442", "tt1130884", "tt1131734", "tt1136608", "tt1142988", "tt1144884", "tt1155076", "tt1156398", "tt1185834", "tt1186367", "tt1190080", "tt1193138", "tt1205489", "tt1220198", "tt1228705", "tt1234559", "tt1236397", "tt1245526", "tt1250777", "tt1259571", "tt1279935", "tt1285016", "tt1314655", "tt1320253", "tt1322277", "tt1325004", "tt1375666", "tt1424381", "tt1504688"].each do |i|
      puts i
      Rake::Task["movies:get"].reenable
      Rake::Task["movies:get"].invoke(i)
      not_saved.push("#{i}") if Movie.get(i).nil?
    end
    
    not_saved.each do |a|
      puts a
    end
  end
end
