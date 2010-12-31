class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.integer :rating
      t.float :votes
      t.string :title
      t.text :plot
      t.string :tagline
      t.string :runtime
      t.integer :top250
      t.string :year
      t.string :picture_path
      t.string :imdbid
      t.boolean :complete
      t.string :download_name

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
