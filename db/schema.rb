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
    t.string "stree_adress", null: false
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

  add_foreign_key "meals", "restaurants"
end
