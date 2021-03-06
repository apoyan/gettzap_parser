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

ActiveRecord::Schema.define(version: 2021_10_20_204105) do

  create_table "products", force: :cascade do |t|
    t.string "price_list"
    t.string "brand", null: false
    t.string "code", null: false
    t.integer "stock", default: 0, null: false
    t.decimal "cost", precision: 12, scale: 2, null: false
    t.string "name"
    t.index ["brand", "code", "price_list"], name: "index_products_on_brand_and_code_and_price_list", unique: true
    t.index ["price_list"], name: "index_products_on_price_list"
  end

end
