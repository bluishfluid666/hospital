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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_160744) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confirm_recoveries", primary_key: ["inpatient_prefix", "inpatient_novem_digit"], force: :cascade do |t|
    t.string "inpatient_prefix", limit: 3, null: false
    t.string "inpatient_novem_digit", limit: 9, null: false
    t.date "discharge_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", primary_key: "did", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "title", limit: 30
    t.string "dean_unique_code", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", primary_key: "unique_code", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "gender", limit: 1
    t.string "address", limit: 100
    t.date "start_date"
    t.string "specialty_name", limit: 50
    t.integer "degree_year"
    t.string "job_type", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dept_code", limit: 20
  end

  create_table "examination_diagnoses", primary_key: ["date_n_time", "doctor_code", "out_patient_prefix", "out_patient_novem_digit", "diagnosis"], force: :cascade do |t|
    t.datetime "date_n_time", null: false
    t.string "doctor_code", limit: 20, null: false
    t.string "out_patient_prefix", limit: 3, null: false
    t.string "out_patient_novem_digit", limit: 9, null: false
    t.string "diagnosis", limit: 300, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examinations", primary_key: ["date_n_time", "doctor_code", "out_patient_prefix", "out_patient_novem_digit"], force: :cascade do |t|
    t.datetime "date_n_time", null: false
    t.string "doctor_code", limit: 20, null: false
    t.string "out_patient_prefix", limit: 3, null: false
    t.string "out_patient_novem_digit", limit: 9, null: false
    t.decimal "fee", precision: 13, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_next_examinations", primary_key: ["date_n_time", "doctor_code", "out_patient_prefix", "out_patient_novem_digit"], force: :cascade do |t|
    t.datetime "date_n_time", null: false
    t.string "doctor_code", limit: 20, null: false
    t.string "out_patient_prefix", limit: 3, null: false
    t.string "out_patient_novem_digit", limit: 9, null: false
    t.datetime "nxt_exam_datetime", null: false
    t.string "nxt_exam_doctor_code", limit: 20, null: false
    t.string "nxt_exam_out_patient_prefix", limit: 3, null: false
    t.string "nxt_exam_out_patient_novem_digit", limit: 9, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_patient_diagnoses", primary_key: ["prefix", "novem_digit", "diagnosis"], force: :cascade do |t|
    t.string "prefix", limit: 3, null: false
    t.string "novem_digit", limit: 9, null: false
    t.string "diagnosis", limit: 300, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_patients", primary_key: ["prefix", "novem_digit"], force: :cascade do |t|
    t.string "prefix", limit: 3, null: false
    t.string "novem_digit", limit: 9, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender", limit: 1
    t.date "dob"
    t.string "phone_number", limit: 13
    t.string "address", limit: 100
    t.date "date_of_admission"
    t.string "sickroom", limit: 10
    t.decimal "fee", precision: 13, scale: 2
    t.string "nurse_unique_code", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "out_patients", primary_key: ["prefix", "novem_digit"], force: :cascade do |t|
    t.string "prefix", limit: 3, null: false
    t.string "novem_digit", limit: 9, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender", limit: 1
    t.date "dob"
    t.string "phone_number"
    t.string "address", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", primary_key: ["owner_code", "phone_number"], force: :cascade do |t|
    t.string "owner_code", limit: 20, null: false
    t.string "phone_number", limit: 13, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", primary_key: ["start_datetime", "end_datetime", "doctor_code", "inpatient_prefix", "inpatient_novem_digit"], force: :cascade do |t|
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime", null: false
    t.string "doctor_code", limit: 20, null: false
    t.string "inpatient_prefix", limit: 3, null: false
    t.string "inpatient_novem_digit", limit: 9, null: false
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "departments", "employees", column: "dean_unique_code", primary_key: "unique_code"
  add_foreign_key "employees", "departments", column: "dept_code", primary_key: "did"
  add_foreign_key "in_patient_diagnoses", "in_patients", column: "prefix", primary_key: "prefix", name: "in_patient_diagnoses_prefix_novem_digit_fkey"
  add_foreign_key "in_patient_diagnoses", "in_patients", column: "prefix", primary_key: "prefix", name: "in_patient_diagnoses_prefix_novem_digit_fkey1"
  add_foreign_key "in_patients", "employees", column: "nurse_unique_code", primary_key: "unique_code"
  add_foreign_key "phones", "employees", column: "owner_code", primary_key: "unique_code"
end
