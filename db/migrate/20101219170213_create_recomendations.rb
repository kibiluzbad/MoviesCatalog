class CreateRecomendations < ActiveRecord::Migration
  def self.up
    create_table :recomendations, :id => false do |t|
      t.string :imdbid
      t.string :title
      t.string :url
      t.string :picture_path

      t.timestamps
    end
    
  end

  def self.down
    drop_table :recomendations
  end
end
