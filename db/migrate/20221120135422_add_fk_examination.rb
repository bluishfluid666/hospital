class AddFkExamination < ActiveRecord::Migration[7.0]
  def change
    execute "alter table examinations add foreign key (doctor_code) references employees(unique_code);"
    execute "alter table examinations add foreign key (out_patient_prefix, out_patient_novem_digit) references out_patients(prefix, novem_digit);"
  end
end
