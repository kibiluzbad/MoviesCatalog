class Genre
  include DataMapper::Resource
  
  property :description, String, :key => true
  property :url, String
  
  has n, :movies, :through => Resource
  
end
