class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters, :id => false do |t|
      t.string :imdbid
      t.string :name
      t.string :actor
      t.string :url
      t.string :picture_path     

      t.timestamps
    end
    
  end

  def self.down
    drop_table :characters
  end
end
