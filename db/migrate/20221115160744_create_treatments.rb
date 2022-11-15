class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments, id: false do |t|
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.string :doctor_code, limit: 20, null: false
      t.string :inpatient_prefix, limit: 3, null: false
      t.string :inpatient_novem_digit, limit: 9, null: false
      t.text :result
      t.timestamps
    end
    execute "alter table treatments add primary key(start_datetime, end_datetime, doctor_code, inpatient_prefix, inpatient_novem_digit);"
  end
end
