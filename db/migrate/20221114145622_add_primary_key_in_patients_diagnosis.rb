class AddPrimaryKeyInPatientsDiagnosis < ActiveRecord::Migration[7.0]
  def change
      execute "alter table in_patient_diagnoses add primary key (prefix, novem_digit, diagnosis);"
  end
end
