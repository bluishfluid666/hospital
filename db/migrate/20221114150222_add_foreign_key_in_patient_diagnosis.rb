class AddForeignKeyInPatientDiagnosis < ActiveRecord::Migration[7.0]
  def change
      execute "alter table in_patient_diagnoses add foreign key (prefix, novem_digit) references in_patients(prefix, novem_digit);"
  end
end
