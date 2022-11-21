class AddFkTreatment < ActiveRecord::Migration[7.0]
  def change
    execute "alter table treatments add foreign key (doctor_code) references employees(unique_code);"
    execute "alter table treatments add foreign key (inpatient_prefix, inpatient_novem_digit) references in_patients(prefix, novem_digit);"
  end
end
