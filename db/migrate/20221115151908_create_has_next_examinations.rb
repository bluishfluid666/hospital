class CreateHasNextExaminations < ActiveRecord::Migration[7.0]
  def change
    create_table :has_next_examinations, id: false do |t|
      t.datetime :date_n_time, null: false
      t.string :doctor_code, limit: 20, null: false
      t.string :out_patient_prefix, limit: 3, null: false
      t.string :out_patient_novem_digit, limit: 9, null: false
      t.datetime :nxt_exam_datetime, null: false
      t.string :nxt_exam_doctor_code, limit: 20, null: false
      t.string :nxt_exam_out_patient_prefix, limit: 3, null: false
      t.string :nxt_exam_out_patient_novem_digit, limit: 9, null: false
      t.timestamps
    end
    execute "alter table has_next_examinations add primary key (date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit);"
  end
end