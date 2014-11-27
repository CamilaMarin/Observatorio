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

ActiveRecord::Schema.define(version: 20141127134651) do

  create_table "actor_tweets", force: true do |t|
    t.integer  "id_at"
    t.integer  "id_actor"
    t.integer  "id_tweet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actors", force: true do |t|
    t.integer  "id_actor"
    t.string   "nombre_actor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuenta", force: true do |t|
    t.integer  "id_cuenta"
    t.integer  "id_actor"
    t.string   "nombre_cuenta"
    t.string   "cantidad_seguidores"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashtags", force: true do |t|
    t.integer  "id_hashtag"
    t.integer  "id_actor"
    t.string   "nombre_hashtag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "palabra_bolsas", force: true do |t|
    t.integer  "id_palabrab"
    t.string   "nombre_palabra"
    t.integer  "puntaje"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "palabra_claves", force: true do |t|
    t.integer  "id_palabra"
    t.integer  "id_actor"
    t.string   "nombre_palabra_clave"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texto_palabras", force: true do |t|
    t.integer  "id_tp"
    t.integer  "id_texto"
    t.integer  "id_palabrab"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textos", force: true do |t|
    t.integer  "id_tweet"
    t.integer  "id_texto"
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.integer  "id_tweet"
    t.integer  "id_texto"
    t.integer  "id_usuario"
    t.string   "region"
    t.date     "fecha"
    t.string   "clasificacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.integer  "id_usuario"
    t.string   "cuenta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
