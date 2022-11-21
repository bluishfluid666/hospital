class AddFkExamDiag < ActiveRecord::Migration[7.0]
  def change
    execute "alter table examination_diagnoses add foreign key (date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit) references examinations(date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit);"
  end
end
