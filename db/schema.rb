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

ActiveRecord::Schema.define(version: 20141113144818) do

  create_table "categories", force: true do |t|
    t.string   "nom"
    t.integer  "mere"
    t.datetime "dateCreation"
    t.datetime "dateModification"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fiche_produits", force: true do |t|
    t.string   "ref"
    t.string   "titre"
    t.text     "description"
    t.text     "descriptionCourte"
    t.datetime "datePublication"
    t.datetime "dateCreation"
    t.datetime "dateModification"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produits", force: true do |t|
    t.string   "ref"
    t.string   "nom"
    t.float    "prix"
    t.datetime "dateCreation"
    t.datetime "dateModification"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_produits", force: true do |t|
    t.string   "nom"
    t.text     "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "utilisateurs", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pseudo"
    t.string   "nom"
    t.string   "prenom"
    t.string   "mail"
    t.string   "mdp"
    t.datetime "dateCreation"
    t.datetime "dateModification"
    t.datetime "dateSuppression"
  end

  add_index "utilisateurs", ["email"], name: "index_utilisateurs_on_email", unique: true
  add_index "utilisateurs", ["reset_password_token"], name: "index_utilisateurs_on_reset_password_token", unique: true

end
