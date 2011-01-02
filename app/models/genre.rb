class Genre
  include DataMapper::Resource
  
  property :description, String, :key => true, :length => 25
  property :url, String, :length => 255
  
  has n, :movies, :through => Resource
  
end
