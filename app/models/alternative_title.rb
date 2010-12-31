class AlternativeTitle
  include DataMapper::Resource

  property :id, Serial  
  property :title, String
  property :country, String
  
  belongs_to :movie
  
end
