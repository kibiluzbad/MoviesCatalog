# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101219170347) do

  create_table "alternative_titles", :force => true do |t|
    t.string   "title"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  create_table "characters", :id => false, :force => true do |t|
    t.string   "imdbid"
    t.string   "name"
    t.string   "actor"
    t.string   "url"
    t.string   "picture_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directors", :id => false, :force => true do |t|
    t.string   "imdbid"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :id => false, :force => true do |t|
    t.string   "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.integer  "rating"
    t.float    "votes"
    t.string   "title"
    t.text     "plot"
    t.string   "tagline"
    t.string   "runtime"
    t.integer  "top250"
    t.string   "year"
    t.string   "picture_path"
    t.string   "imdbid"
    t.boolean  "complete"
    t.string   "download_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies_characters", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.string  "character_id"
  end

  create_table "movies_directors", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.string  "director_id"
  end

  create_table "movies_genres", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.string  "genre_id"
  end

  create_table "movies_recomendations", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.string  "recomendation_id"
  end

  create_table "movies_writers", :id => false, :force => true do |t|
    t.integer "movie_id"
    t.string  "writer_id"
  end

  create_table "recomendations", :id => false, :force => true do |t|
    t.string   "imdbid"
    t.string   "title"
    t.string   "url"
    t.string   "picture_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "writers", :id => false, :force => true do |t|
    t.string   "imdbid"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
