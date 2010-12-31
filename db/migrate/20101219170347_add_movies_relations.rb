class AddMoviesRelations < ActiveRecord::Migration
  def self.up
    alter_table :alternative_titles do |t|
      t.integer :movie_id
    end
    
    create_table :movies_characters, :id=>false do |t|
      t.integer :movie_id
      t.string :character_id
    end
    
    create_table :movies_directors, :id=>false do |t|
      t.integer :movie_id
      t.string :director_id
    end
    
    create_table :movies_genres, :id=>false do |t|
      t.integer :movie_id
      t.string :genre_id
    end
    
    create_table :movies_recomendations, :id=>false do |t|
      t.integer :movie_id
      t.string :recomendation_id
    end
    
    create_table :movies_writers, :id=>false do |t|
      t.integer :movie_id
      t.string :writer_id
    end
  end

  def self.down
    remove_column :movie_id
    drop_table :movies_characters
    drop_table :movies_directors
    drop_table :movies_genres
    drop_table :movies_recomendations
    drop_table :movies_writers
  end
end
