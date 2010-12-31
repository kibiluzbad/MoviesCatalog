class CreateAlternativeTitles < ActiveRecord::Migration
  def self.up
    create_table :alternative_titles do |t|
      t.string :title
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :alternative_titles
  end
end
