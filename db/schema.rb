# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140422212339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "artist_attachments", force: true do |t|
    t.string   "photo"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_attachments", ["artist_id"], name: "index_artist_attachments_on_artist_id", using: :btree

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "real_name"
    t.date     "birthday"
    t.date     "death"
    t.string   "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.integer  "country_id"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", using: :btree

  create_table "artists_professions", id: false, force: true do |t|
    t.integer "artist_id",     null: false
    t.integer "profession_id", null: false
  end

  add_index "artists_professions", ["artist_id", "profession_id"], name: "index_artists_professions_on_artist_id_and_profession_id", using: :btree
  add_index "artists_professions", ["profession_id", "artist_id"], name: "index_artists_professions_on_profession_id_and_artist_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "english_name"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films", force: true do |t|
    t.string   "title"
    t.string   "brazilian_title"
    t.date     "release"
    t.text     "synopse"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genre"
    t.string   "poster"
    t.integer  "country_id"
    t.string   "length"
  end

  add_index "films", ["brazilian_title"], name: "index_films_on_brazilian_title", using: :btree

  create_table "media", force: true do |t|
    t.string   "type"
    t.date     "release_date"
    t.string   "pakage"
    t.integer  "qtd_discs"
    t.decimal  "price",         precision: 5, scale: 2
    t.string   "art"
    t.string   "distribuidora"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "pictures", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type", limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "info"
  end

  add_index "pictures", ["imageable_id", "imageable_type"], name: "index_pictures_on_imageable_id_and_imageable_type", using: :btree
  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "production_team", force: true do |t|
    t.integer  "film_id"
    t.integer  "artist_id"
    t.boolean  "cast",       default: false
    t.boolean  "writer",     default: false
    t.boolean  "director",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_team", ["artist_id"], name: "index_production_team_on_artist_id", using: :btree
  add_index "production_team", ["film_id"], name: "index_production_team_on_film_id", using: :btree

  create_table "professions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
