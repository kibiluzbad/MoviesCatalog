namespace :movies do
	desc "Search movies using the movie provider by query."	
	task :search, [:query] => :environment do |t,args|
	  provider = Thoth.new
	  movie = Movie.create!({:download_name => args.query, :complete => false})
	  movies = provider.search(args.query)
	  completed = movies.select{|m| !m["imdbid"].nil?}
    unique = completed.uniq{|m| m["imdbid"].to_s.strip!}
	
	  if( 1 == unique.count)
      create_movie(unique.first["imdbid"])
    end
	  #puts movies
	  #puts movies.select{|m| !m["imdbid"].nil?}.count
	  #TODO: Incluir codigo para verifcar se o filme foi encontrado e salva-lo no banco.
	end
	
	desc "Search for movie using the movie provider by imdbid."	
	task :get, [:imdbid] => :environment do |t,args|
    create_movie(args.imdbid)	  
	end

  def create_movie(imdbid)
    provider = Thoth.new
	  movie = provider.get_movie(imdbid)
	  if(movie["error"].nil?)
	    m = Movie.first_or_create({:imdbid => imdbid})
	    m.update_from(movie)
      puts "Movie #{m.title} saved!"
    else
      puts "Movie not saved!"
    end
  end
	
	desc "Load movies from hash."
	task :load => :environment do
	  not_saved = []
    [["tt0887912","The Hurt Locker"],
["tt0134847","Pitch Black"],
["tt0093058","Full Metal Jacket"],
["tt0066921","A Clockwork Orange"],
["tt1045772","I Love You Phillip Morris"],
["tt0438488","Terminator Salvation"],
["tt1055369","Transformers 2 Revenge Of The Fallen"],
["tt1037705","The Book of Eli"],
["tt0780653","The Wolfman"],
["tt1014759","Alice in Wonderland"],
["tt1130884","Shutter Island"],
["tt1322277","Besouro"],
["tt0499549","Avatar"],
["tt1259571","New moon"],
["tt0814255","Percy Jackson and the Olympians"],
["tt1038686","Legion"],
["tt1039960","Estomago"],
["tt1220198","The Fourth Kind"],
["tt1186367","Ninja Assassin"],
["tt1028532","Hachiko A Dogs Story"],
["tt0971209","A Perfect Getaway"],
["tt0318462","Diarios De Motocicleta"],
["tt0064276","Easy Rider"],
["tt1193138","Up In The Air"],
["tt0988045","Sherlock Holmes"],
["tt0075066","The Pink Panther Strikes Again"],
["tt0058586","A Shot in The Dark"],
["tt0057413","The Pink Panther"],
["tt0407887","The Departed"],
["tt0114746","Twelve Monkeys"],
["tt1144884","The Final Destination"],
["tt1098327","Dragonball Evolution"],
["tt1125849","The Wrestler"],
["tt1068678","Veronika Decides To Die"],
["tt1049413","Up"],
["tt0457400","Land Of The Lost"],
["tt1156398","Zombieland"],
["tt1142988","The Ugly Truth"],
["tt1045778","Year One"],
["tt0986263","Surrogates"],
["tt1504688","Os Normais 2"],
["tt1190080","2012"],
["tt1136608","District 9"],
["tt1034032","Gamer"],
["tt1121931","Crank High Voltage"],
["tt1131734","Jennifer\"s Body"],
["tt0887883","Burn After Reading"],
["tt0361748","Inglourious Basterds"],
["tt0360717","King Kong"],
["tt0427944","Thank You For Smoking"],
["tt0129387","There\"s something about mary"],
["tt0889583","Bruno"],
["tt0417741","Harry Potter - And The Half Blood Prince"],
["tt0486655","Stardust"],
["tt0351459","Os Normais"],
["tt0425123","Just Like Heaven"],
["tt0420223","Stranger Than Fiction"],
["tt0410297","The Lake House"],
["tt1236397","A Mulher Invisivel"],
["tt1129442","Transporter 3"],
["tt0137523","Fight Club"],
["tt0120657","The 13TH Warrior"],
["tt0120737","The Lord of the Rings - The Fellowship of the Ring"],
["tt0167260","The Lord of the Rings - The Return of the King"],
["tt0167261","The Lord of the Rings - The Two Towers"],
["tt1046173","G.I. Joe The Rise Of Cobra"],
["tt0970416","The Day The Earth Stood Still"],
["tt0960144","You Dont mess with Zohan"],
["tt0319061","Big Fish"],
["tt0942385","Tropic Thunder"],
["tt0095159","A Fish Called Wanda"],
["tt0489458","O Cheiro do Ralo"],
["tt1020885","Lesbian Vampire Killers"],
["tt0401792","Sin City"],
["tt0445922","Across the Universe"],
["tt0796366","Star Trek"],
["tt0325980","Pirates of The Caribbean - The Curse of The Black Pearl"],
["tt0383574","Pirates of The Caribbean - Dead Man\"s Chest"],
["tt0449088","Pirates of The Caribbean - At World\"s End"],
["tt0451079","Horton Hears A Who!"],
["tt0865556","The Forbidden Kingdom"],
["tt0482603","Space Chimps"],
["tt0203009","Moulin Rouge"],
["tt0411477","Hellboy II - The Golden Army"],
["tt0441773","Kung Fu Panda"],
["tt0063415","The Party"],
["tt0070034","Enter The Dragon"],
["tt0373889","Harry Potter - And The Order Of The Phoenix"],
["tt0330373","Harry Potter - And The Goblet Of Fire"],
["tt0304141","Harry Potter - And The Prisoner Of Azkaban"],
["tt0295297","Harry Potter - And The Chamber Of Secrets"],
["tt0241527","Harry Potter - And The Philosopher\"s Stone"],
["tt1080016","Ice Age 3 - Dawn Of The Dinosaurs"],
["tt0242653","The Matrix - Revolutions"],
["tt0234215","The Matrix - Reloaded"],
["tt0133093","The Matrix"],
["tt0371724","The Hitchhiker\"s Guide to the Galaxy"],
["tt0110148","Interview With The Vampire"],
["tt0078748","Alien"],
["tt1099212","Twilight"],
["tt0259711","Vanilla Sky"],
["tt0859163","The Mummy - Tomb Of The Dragon Emperor"],
["tt0409459","Watchmen"],
["tt0808151","Angels & Demons"],
["tt0434409","V For Vendetta"],
["tt0861739","Tropa de Elite"],
["tt0408236","Sweeney Todd - The Demon Barber Of Fleet Street"],
["tt0891592","Street Fighter - The Legend of Chun Li"],
["tt1185834","Star Wars - The Clone Wars"],
["tt0086190","Star Wars - Episode VI - Return Of The Jedi"],
["tt0080684","Star Wars - Episode V - The Empire Strikes Back"],
["tt0076759","Star Wars - Episode IV - A New Hope"],
["tt0121766","Star Wars - Episode III - Revenge of the Sith"],
["tt0121765","Star Wars - Episode II - Attack of the Clones"],
["tt0120915","Star Wars - Episode I The Phantom Menace"],
["tt0890870","SAW IV"],
["tt1034331","Righteous Kill"],
["tt0110912","Pulp Fiction"],
["tt0857355","O Ano em que Meus Pais Sairam de Ferias"],
["tt0209144","Memento"],
["tt0416320","Match Point"],
["tt0479952","Madagascar 2 - Escape to Africa"],
["tt0449059","Little Miss Sunshine"],
["tt0758758","Into The Wild"],
["tt0113568","Ghost in The Shell"],
["tt0091042","Ferris Bueller\"s Day Off"],
["tt1013752","Fast and Furious 2009"],
["tt0338013","Eternal Sunshine of the Spotless Mind"],
["tt0419706","Doom"],
["tt0479884","Crank"],
["tt0468569","Batman The Dark Knight"],
["tt0119822","As Good as It Gets"],
["tt0169547","American Beauty"],
["tt0080339","Airplane!"],
["tt0083530","Airplane II The Sequel"],
["tt0062622","2001 A Space Odyssey"],
["tt0499603","10 Items or Less"],
["tt0830515","007 - Quantum Of Solace"],
["tt0458525","X-Men Origins Wolverine"],
["tt0800320","Clash of the titans"],
["tt0366548","Happy Feet"],
["tt1234559","Chico Xavier"],
["tt0107048","Groundhog Day"],
["tt1279935","Date Night"],
["tt0892769","How To Train Your Dragon"],
["tt0473075","Prince of Persia The Sands of Time"],
["tt1325004","The Twilight Saga Eclipse"],
["tt0815245","The Uninvited"],
["tt0955308","Robin Hood"],
["tt0371746","Ironman"],
["tt1228705","IronMan 2"],
["tt1155076","The Karate Kid"],
["tt1320253","The Expendables"],
["tt0938283","The Last Airbender"],
["tt1424381","Predators"],
["tt1245526","Red"],
["tt0435761","Toy Story 3"],
["tt1375666","Inception"],
["tt0090728","Big Trouble in Little China"],
["tt1075747","Jonah Hex"],
["tt0116409","The Ghost and the Darkness"],
["tt0103064","Terminator 2 Judgment Day"],
["tt1053424","Repo Men"],
["tt0083658","Blade Runner"],
["tt1285016","The Social Network"],
["tt1068680","Yes Man"],
["tt0985694","Machete"],
["tt1314655","Devil"],
["tt1205489","Gran Torino"],
["tt1250777","Kick-Ass"],
["tt0446029","Scott Pilgrim vs the World"],
["tt1028528","Death Proof"],
["tt0067927","Vanishing Point"],
["tt0378194","Kill Bill Vol 2"],
["tt0266697","Kill Bill Vol 1"],
["tt0963966","The Sorcerers Apprentice"],
["tt0116367","From Dusk Till Dawn"],
["tt1263670","Crazy Heart"],
["tt0105236","Reservoir Dogs"],
["tt1001526","Megamind"],
["tt0926084","Harry Potter And The Deathly Hallows Part 1"],
["tt1323594","Despicable me"]].each do |i|
      puts i
      Rake::Task["movies:get"].reenable
      Rake::Task["movies:get"].invoke(i[0])
      movie = Movie.get(i[0])
      not_saved.push("#{i[0]}") if movie.nil?
      unless movie.nil?
        movie.download_name = i[1]
        movie.save!
      end
    end
    
    not_saved.each do |a|
      puts a
    end
  end
end
