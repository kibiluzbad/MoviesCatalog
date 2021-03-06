class Recomendation
  include DataMapper::Resource
  
  property :imdbid, String, :key => true
  property :title, String, :length => 255
  property :url, String, :length => 255
  property :picture_path, String, :length => 255
  
  has n, :movies, :through => Resource
      
end
