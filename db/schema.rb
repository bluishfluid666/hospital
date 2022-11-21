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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_010235) do
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
    t.string "title", limit: 30, null: false
    t.string "dean_unique_code", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", primary_key: "unique_code", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "dob", null: false
    t.string "gender", limit: 1
    t.string "address", limit: 100
    t.date "start_date", null: false
    t.string "specialty_name", limit: 50
    t.integer "degree_year"
    t.string "job_type", limit: 15, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dept_code", limit: 20, null: false
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
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", limit: 1, null: false
    t.date "dob", null: false
    t.string "phone_number", limit: 13, null: false
    t.string "address", limit: 100, null: false
    t.date "date_of_admission"
    t.string "sickroom", limit: 10
    t.decimal "fee", precision: 13, scale: 2
    t.string "nurse_unique_code", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_effects", primary_key: ["mid", "effect"], force: :cascade do |t|
    t.string "mid", limit: 20, null: false
    t.string "effect", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", primary_key: "mid", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 11, scale: 2, null: false
    t.date "expiration_date", null: false
    t.integer "quantity", null: false
    t.datetime "imported_datetime", null: false
    t.decimal "imported_price", precision: 11, scale: 2, null: false
    t.string "provider_number", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "out_patients", primary_key: ["prefix", "novem_digit"], force: :cascade do |t|
    t.string "prefix", limit: 3, null: false
    t.string "novem_digit", limit: 9, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", limit: 1, null: false
    t.date "dob", null: false
    t.string "phone_number", null: false
    t.string "address", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", primary_key: ["owner_code", "phone_number"], force: :cascade do |t|
    t.string "owner_code", limit: 20, null: false
    t.string "phone_number", limit: 13, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", primary_key: "pid", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "address", limit: 100
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

  create_table "use_examination_medications", primary_key: ["date_time", "doctor_code", "out_patient_prefix", "out_patient_novem_digit", "med_id"], force: :cascade do |t|
    t.datetime "date_time", null: false
    t.string "doctor_code", null: false
    t.string "out_patient_prefix", limit: 3, null: false
    t.string "out_patient_novem_digit", limit: 9, null: false
    t.string "med_id", limit: 20, null: false
    t.integer "prescribed_qnt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "use_treatment_medications", primary_key: ["start_datetime", "end_datetime", "doctor_code", "inpatient_prefix", "inpatient_novem_digit", "med_id"], force: :cascade do |t|
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime", null: false
    t.string "doctor_code", null: false
    t.string "inpatient_prefix", limit: 3, null: false
    t.string "inpatient_novem_digit", limit: 9, null: false
    t.string "med_id", limit: 20, null: false
    t.integer "prescribed_qnt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "confirm_recoveries", "in_patients", column: "inpatient_prefix", primary_key: "prefix", name: "confirm_recoveries_inpatient_prefix_inpatient_novem_digit_fkey"
  add_foreign_key "departments", "employees", column: "dean_unique_code", primary_key: "unique_code"
  add_foreign_key "employees", "departments", column: "dept_code", primary_key: "did"
  add_foreign_key "examination_diagnoses", "examinations", column: "date_n_time", primary_key: "date_n_time", name: "examination_diagnoses_date_n_time_doctor_code_out_patient__fkey"
  add_foreign_key "examinations", "employees", column: "doctor_code", primary_key: "unique_code", name: "examinations_doctor_code_fkey"
  add_foreign_key "examinations", "out_patients", column: "out_patient_prefix", primary_key: "prefix", name: "examinations_out_patient_prefix_out_patient_novem_digit_fkey"
  add_foreign_key "has_next_examinations", "examinations", column: "date_n_time", primary_key: "date_n_time", name: "has_next_examinations_date_n_time_doctor_code_out_patient__fkey"
  add_foreign_key "has_next_examinations", "examinations", column: "nxt_exam_datetime", primary_key: "date_n_time", name: "has_next_examinations_nxt_exam_datetime_nxt_exam_doctor_co_fkey"
  add_foreign_key "in_patient_diagnoses", "in_patients", column: "prefix", primary_key: "prefix", name: "in_patient_diagnoses_prefix_novem_digit_fkey"
  add_foreign_key "in_patient_diagnoses", "in_patients", column: "prefix", primary_key: "prefix", name: "in_patient_diagnoses_prefix_novem_digit_fkey1"
  add_foreign_key "in_patients", "employees", column: "nurse_unique_code", primary_key: "unique_code"
  add_foreign_key "in_patients", "in_patients", column: "prefix", primary_key: "prefix", name: "in_patients_prefix_novem_digit_fkey"
  add_foreign_key "medication_effects", "medications", column: "mid", primary_key: "mid", name: "medication_effects_mid_fkey"
  add_foreign_key "medications", "providers", column: "provider_number", primary_key: "pid", name: "medications_provider_number_fkey"
  add_foreign_key "phones", "employees", column: "owner_code", primary_key: "unique_code"
  add_foreign_key "treatments", "employees", column: "doctor_code", primary_key: "unique_code", name: "treatments_doctor_code_fkey"
  add_foreign_key "treatments", "in_patients", column: "inpatient_prefix", primary_key: "prefix", name: "treatments_inpatient_prefix_inpatient_novem_digit_fkey"
  add_foreign_key "use_examination_medications", "examinations", column: "date_time", primary_key: "date_n_time", name: "use_examination_medications_date_time_doctor_code_out_pati_fkey"
  add_foreign_key "use_examination_medications", "medications", column: "med_id", primary_key: "mid", name: "use_examination_medications_med_id_fkey"
  add_foreign_key "use_treatment_medications", "medications", column: "med_id", primary_key: "mid", name: "use_treatment_medications_med_id_fkey"
  add_foreign_key "use_treatment_medications", "treatments", column: "start_datetime", primary_key: "start_datetime", name: "use_treatment_medications_start_datetime_end_datetime_doct_fkey"
end
