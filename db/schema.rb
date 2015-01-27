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

ActiveRecord::Schema.define(version: 20150126165731) do

  create_table "categories", force: true do |t|
    t.string   "nom"
    t.integer  "mere"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extension_fichiers", force: true do |t|
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extension_fichiers_type_produits", id: false, force: true do |t|
    t.integer "extension_fichier_id", null: false
    t.integer "type_produit_id",      null: false
  end

  create_table "fiche_produits", force: true do |t|
    t.string   "ref"
    t.string   "titre"
    t.text     "description"
    t.text     "descriptionCourte"
    t.datetime "datePublication"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formats", force: true do |t|
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_produits_id"
  end

  create_table "param_tvas", force: true do |t|
    t.float    "valeur"
    t.string   "label"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produits", force: true do |t|
    t.string   "ref"
    t.string   "nom"
    t.float    "prix"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_produits_id"
    t.text     "description"
    t.text     "descriptionCourte"
    t.datetime "datePublication"
    t.boolean  "estPublic"
  end

  create_table "produits_tags", id: false, force: true do |t|
    t.integer "produit_id", null: false
    t.integer "tag_id",     null: false
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "tags", force: true do |t|
    t.string   "nom"
    t.integer  "mere"
    t.datetime "dateSuppression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_produits", force: true do |t|
    t.string   "nom"
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
    t.string   "mdp"
    t.datetime "dateSuppression"
  end

  add_index "utilisateurs", ["reset_password_token"], name: "index_utilisateurs_on_reset_password_token", unique: true

  create_table "utilisateurs_roles", id: false, force: true do |t|
    t.integer "utilisateur_id"
    t.integer "role_id"
  end

  add_index "utilisateurs_roles", ["utilisateur_id", "role_id"], name: "index_utilisateurs_roles_on_utilisateur_id_and_role_id"

end
