class Character
  include DataMapper::Resource
  
  property :imdbid, String, :key => true
  property :name, String, :length => 255
  property :actor, String, :length => 255
  property :url, String, :length => 255
  property :picture_path, String, :length => 255
  
  has n, :movies, :through => Resource

end
