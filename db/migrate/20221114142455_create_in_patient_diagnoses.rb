class CreateInPatientDiagnoses < ActiveRecord::Migration[7.0]
  def change
    create_table :in_patient_diagnoses, id: false, primary_key: [:prefix, :novem_digit, :diagnosis] do |t|
      t.string :prefix, limit: 3
      t.string :novem_digit, limit: 9
      t.string :diagnosis, limit: 300
      t.timestamps
    end
  end
end
