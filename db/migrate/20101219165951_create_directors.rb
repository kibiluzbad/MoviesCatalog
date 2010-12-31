class CreateDirectors < ActiveRecord::Migration
  def self.up
    create_table :directors, :id => false do |t|
      t.string :imdbid
      t.string :name
      t.string :url      

      t.timestamps
    end
    
  end

  def self.down
    drop_table :directors
  end
end
