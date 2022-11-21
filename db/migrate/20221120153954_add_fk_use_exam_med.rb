class AddFkUseExamMed < ActiveRecord::Migration[7.0]
  def change
    execute "alter table use_examination_medications add foreign key (date_time, doctor_code, out_patient_prefix, out_patient_novem_digit) references examinations(date_n_time, doctor_code, out_patient_prefix, out_patient_novem_digit);"
    execute "alter table use_examination_medications add foreign key (med_id) references medications(mid);"
  end
end
