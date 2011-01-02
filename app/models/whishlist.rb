class Whishlist
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => 255
  property :created_at, DateTime

end
