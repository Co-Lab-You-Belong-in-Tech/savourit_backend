# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_01_043605) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meals", force: :cascade do |t|
    t.string "name", default: ""
    t.string "price", default: ""
    t.text "description", default: ""
    t.text "photo", default: ""
    t.string "rating", default: ""
    t.string "user_ratings_total", default: ""
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", default: ""
    t.string "description", default: ""
    t.string "location", default: ""
    t.string "location_lat", default: ""
    t.string "location_lng", default: ""
    t.string "user_ratings_total", default: ""
    t.string "opening_hours", default: ""
    t.string "rating", default: ""
    t.string "payment", default: ""
    t.text "itinerary", default: ""
    t.text "image", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meals", "restaurants"
end
