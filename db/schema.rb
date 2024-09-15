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

ActiveRecord::Schema[7.1].define(version: 2024_09_15_151418) do
  create_table "migration_logs", force: :cascade do |t|
    t.integer "patients_imported"
    t.float "migration_duration"
    t.datetime "migration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "health_identifier"
    t.string "health_identifier_province"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "phone"
    t.string "email"
    t.string "address1"
    t.string "address2"
    t.string "address_province"
    t.string "address_city"
    t.string "address_postal_code"
    t.date "date_of_birth"
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vitals", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.string "vital_type"
    t.float "measurement"
    t.string "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_vitals_on_patient_id"
  end

  add_foreign_key "vitals", "patients"
end
