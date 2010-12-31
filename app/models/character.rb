class Character
  include DataMapper::Resource
  
  property :imdbid, String, :key => true
  property :name, String
  property :actor, String
  property :url, String
  property :picture_path, String
  
  has n, :movies, :through => Resource

end
