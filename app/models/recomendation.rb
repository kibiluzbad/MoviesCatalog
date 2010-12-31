class Recomendation
  include DataMapper::Resource
  
  property :imdbid, String, :key => true
  property :title, String
  property :url, String
  property :picture_path, String
  
  has n, :movies, :through => Resource
      
end
