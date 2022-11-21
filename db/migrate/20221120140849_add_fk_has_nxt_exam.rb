class AddFkHasNxtExam < ActiveRecord::Migration[7.0]
  def change
    execute "alter table has_next_examinations add foreign key (date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit) references examinations(date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit);"
    execute "alter table has_next_examinations add foreign key (nxt_exam_datetime, nxt_exam_doctor_code, nxt_exam_out_patient_prefix, nxt_exam_out_patient_novem_digit) references examinations(date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit);"
  end
end
