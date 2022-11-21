class AddFkUseTreatmentMed < ActiveRecord::Migration[7.0]
  def change
    execute "alter table use_treatment_medications add foreign key (start_datetime, end_datetime, doctor_code, inpatient_prefix, inpatient_novem_digit) references treatments(start_datetime, end_datetime, doctor_code, inpatient_prefix, inpatient_novem_digit);"
    execute "alter table use_treatment_medications add foreign key (med_id) references medications(mid);"

  end
end
