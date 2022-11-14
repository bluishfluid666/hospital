class CreateInPatients < ActiveRecord::Migration[7.0]
  def change
    create_table :in_patients, id: false, primary_key: [:prefix, :novem_digit] do |t|
      t.string :prefix, limit: 3
      t.string :novem_digit, limit: 9
      t.string :first_name
      t.string :last_name
      t.string :gender, limit: 1
      t.date :dob
      t.string :phone_number, limit: 13
      t.string :address, limit: 100
      t.date :date_of_admission
      t.string :sickroom, limit: 10
      t.decimal :fee, precision: 13, scale: 2
      t.string :nurse_unique_code, limit: 20
      t.timestamps
    end
    add_foreign_key :in_patients, :employees, column: :nurse_unique_code, primary_key: "unique_code"
    execute "alter table in_patients add primary key (prefix, novem_digit);"
  end
end
