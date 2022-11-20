class CreateUseExaminationMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :use_examination_medications, id: false do |t|
      t.datetime :date_time, null: false
      t.string :doctor_code, null: false
      t.string :out_patient_prefix, limit: 3
      t.string :out_patient_novem_digit, limit: 9
      t.string :med_id, null: false, limit: 20
      t.integer :prescribed_qnt, null: false
      t.timestamps
    end
    execute "alter table use_examination_medications add primary key (date_time, doctor_code, out_patient_prefix, out_patient_novem_digit, med_id);"
  end
end
