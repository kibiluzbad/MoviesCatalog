class Movie 
  include DataMapper::Resource
  
  property :imdbid        , String, :key => true
  property :rating        , Float
  property :votes         , Float
  property :title         , String
  property :plot          , Text
  property :tagline       , String
  property :runtime       , String
  property :top250        , Integer
  property :year          , String
  property :picture_path  , String
  property :complete      , Boolean
  property :download_name , String
  property :created_at    , DateTime
  
  has n, :alternative_titles
  has n, :characters      , :through => Resource
  has n, :directors       , :through => Resource
  has n, :genres          , :through => Resource
  has n, :recomendations  , :through => Resource
  has n, :writers         , :through => Resource  
  
  def url
    "http://www.imdb.com/title/#{self.imdbid}"
  end
  
  def self.top10
    all(:complete => true, :order => [:rating.desc, :top250], :limit => 10)
  end
  
  def self.incomplete
    all(:complete => false,:order => [:created_at.desc])
  end
  
  def self.filter(query)
    all(:title.like => "%#{query}%",:order => [:rating.desc, :top250])
  end
  
end
