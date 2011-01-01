require 'httparty'

class Thoth
  include HTTParty
  base_uri 'http://thothapp.heroku.com'

  
  def search(title)
    self.class.get("/search/#{title}").parsed_response
  end
  
  def get_movie(imdbid)
    self.class.get("/movie/#{imdbid}").parsed_response
  end
end
