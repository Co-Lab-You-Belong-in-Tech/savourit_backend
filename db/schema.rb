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

ActiveRecord::Schema[7.0].define(version: 2022_12_02_222353) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_meals", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_meals_on_category_id"
    t.index ["meal_id"], name: "index_category_meals_on_meal_id"
  end

  create_table "imagers", force: :cascade do |t|
    t.string "link"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_imagers_on_restaurant_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "title", null: false
    t.float "price", null: false
    t.text "description", default: ""
    t.text "image_url", default: ""
    t.boolean "desactivate", default: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "adress", null: false
    t.string "street_adress", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.string "postal_code", default: ""
    t.string "region", default: ""
    t.string "latitude", default: ""
    t.string "longitude", default: ""
    t.string "phone_number", default: ""
    t.string "currency_code", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubers", force: :cascade do |t|
    t.string "uuid"
    t.string "slug"
    t.string "city_slug"
    t.integer "city_id"
    t.boolean "delivery"
    t.boolean "pickup"
    t.float "rating_value"
    t.integer "rating_count"
    t.string "time_delivery"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_ubers_on_restaurant_id"
  end

  add_foreign_key "imagers", "restaurants"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "ubers", "restaurants"
end
