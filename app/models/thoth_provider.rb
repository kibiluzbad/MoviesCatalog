require 'httparty'
require 'uri'

class Thoth
  include HTTParty
  base_uri 'http://thothapp.heroku.com'

  
  def search(title)
    title = URI.escape(title, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    self.class.get("/search/#{title}").parsed_response
  end
  
  def get_movie(imdbid)
    imdbid = URI.escape(imdbid, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    self.class.get("/movie/#{imdbid}").parsed_response
  end
end
