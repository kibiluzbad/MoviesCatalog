class Movie 
  include DataMapper::Resource
  
  property :imdbid        , String, :key => true
  property :rating        , Float
  property :votes         , Float
  property :title         , String, :length => 255
  property :plot          , Text
  property :tagline       , String, :length => 2000
  property :runtime       , String, :length => 255
  property :top250        , Integer
  property :year          , String, :length => 25
  property :picture_path  , String, :length => 255
  property :complete      , Integer
  property :download_name , String, :length => 255
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
    all(:complete => 1, :order => [:rating.desc, :top250], :limit => 10)
  end
  
  def self.incomplete
    all(:complete => 0,:order => [:created_at.desc])
  end
  
  def self.filter(query,page = 1)
    code = ""
    query.each do |item| 
      code += " & " unless code.empty?
      code += "page('#{item[0]}'=>'#{item[1]}',:order => [:rating.desc, :top250],:per_page => 10,:page=>#{page})"  
    end
    RAILS_DEFAULT_LOGGER.info(code)
    eval code
  end
  
  def update_from(hash = {})
    
    self.title = hash["title"]
    self.rating = hash["rating"]
    self.votes = hash["votes"]
    self.plot = hash["plot"]
    self.tagline = hash["tagline"]
    self.runtime = hash["runtime"]
    self.top250 = hash["top250"]
    self.year = hash["year"]
    self.picture_path = hash["picture_path"]
    self.complete = 1
    
    hash["recomendations"].collect do |r| 
      saved = Recomendation.first_or_create({:imdbid => r["imdbid"]})
      saved.update(r)
      self.recomendations << saved
    end
    
    hash["cast"].collect do |r| 
      saved = Character.first_or_create({:imdbid => r["imdbid"]})    
      saved.update(r)
      saved.set_actor_imdbid
      self.characters << saved
    end
    
    hash["directors"].collect do |r| 
      saved = Director.first_or_create({:imdbid => r["imdbid"]})
      saved.update(r)
      self.directors << saved
    end
    
    hash["genres"].collect do |r| 
      saved = Genre.first_or_create({:description => r, :url => "http://www.imdb.com/genre/#{r}"})
      self.genres << saved
    end
    
    hash["writers"].collect do |r| 
      saved = Writer.first_or_create({:imdbid => r["imdbid"]})
      saved.update(r)
      self.writers << saved
    end
    
    self.save!
  end  
end
