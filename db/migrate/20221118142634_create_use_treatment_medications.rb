class CreateUseTreatmentMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :use_treatment_medications, id: false do |t|
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.string :doctor_code, null: false
      t.string :inpatient_prefix, limit: 3
      t.string :inpatient_novem_digit, limit: 9
      t.string :med_id, null: false, limit: 20
      t.integer :prescribed_qnt, null: false
      t.timestamps
    end
    execute "alter table use_treatment_medications add primary key (start_datetime, end_datetime, doctor_code, inpatient_prefix, inpatient_novem_digit, med_id);"
  end
end
