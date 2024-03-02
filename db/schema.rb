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

ActiveRecord::Schema[7.1].define(version: 2024_03_02_133432) do
  create_table "payment_tags", id: false, force: :cascade do |t|
    t.integer "payment_id"
    t.integer "tag_id"
    t.index ["payment_id"], name: "index_payment_tags_on_payment_id"
    t.index ["tag_id"], name: "index_payment_tags_on_tag_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.integer "amount", null: false
    t.integer "direction", null: false
    t.integer "tags_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tags_id"], name: "index_payments_on_tags_id"
  end

  create_table "rules", force: :cascade do |t|
    t.integer "operator", null: false
    t.string "value", null: false
    t.integer "action", null: false
    t.integer "action_target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_tags_on_payment_id"
  end

  add_foreign_key "payment_tags", "payments"
  add_foreign_key "payment_tags", "tags"
  add_foreign_key "tags", "payments"
end
