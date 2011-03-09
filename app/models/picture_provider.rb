require 'httparty'

class PictureProvider
  include HTTParty
  base_uri 'http://localhost:9393'

  
  def get_path(imdbid)
    self.class.get("/#{imdbid}").parsed_response
  end

end
