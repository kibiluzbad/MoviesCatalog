class Character
  include DataMapper::Resource
  
  property :imdbid, String, :key => true
  property :name, String, :length => 255
  property :actor, String, :length => 255
  property :url, String, :length => 255
  property :picture_path, String, :length => 255
  property :actor_imdbid, String, :length => 30
  
  has n, :movies, :through => Resource
  
  def set_actor_imdbid
    match = /nm[0-9]+/.match(self.url)
    self.actor_imdbid = match[0] if match
  end

end
