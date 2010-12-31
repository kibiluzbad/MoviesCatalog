class CreateGenres < ActiveRecord::Migration
  def self.up
    create_table :genres, :id => false do |t|
      t.string :description
      t.string :url

      t.timestamps
    end
    
  end

  def self.down
    drop_table :genres
  end
end
