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

ActiveRecord::Schema.define(version: 2021_12_18_081612) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "menu_id"
    t.integer "recipe_id"
    t.float "total_protein"
    t.float "total_fat"
    t.integer "total_cal"
    t.float "total_carbon"
    t.float "total_salt"
    t.float "total_vit_b1"
    t.float "total_vit_b2"
    t.float "total_vit_c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.float "ing_protein"
    t.float "ing_fat"
    t.integer "ing_cal"
    t.float "ing_carbon"
    t.float "ing_salt"
    t.float "ing_vit_b1"
    t.float "ing_vit_b2"
    t.float "ing_vit_c"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ings", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "user_id"
    t.integer "recipe_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_ing_id"
    t.integer "cal"
    t.float "protein"
    t.float "fat"
    t.float "carbon"
    t.float "salt"
    t.float "vit_b1"
    t.float "vit_b2"
    t.float "vit_c"
    t.string "name"
    t.string "image_id"
    t.text "explanation"
    t.integer "ing_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "age"
    t.float "hight"
    t.float "wight"
    t.float "bmi"
    t.date "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.date "birthday"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
