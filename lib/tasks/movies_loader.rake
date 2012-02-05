require "#{::Rails.root.to_s}/app/helpers/movies_service"
include MoviesService
namespace :movies do
	desc "Search movies using the movie provider by query."	
	task :search, [:query] => :environment do |t,args|
	  search_by_name args.query
	end
	
	desc "Search for movie using the movie provider by imdbid."	
	task :get, [:imdbid] => :environment do |t,args|
    create_movie(args.imdbid)	  
	end

end
