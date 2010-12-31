class Director
  include DataMapper::Resource
  
  property :imdbid, String, :key => true
  property :name, String
  property :url, String
  
  has n, :movies, :through => Resource
  
end
