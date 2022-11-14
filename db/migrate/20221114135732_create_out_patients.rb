class CreateOutPatients < ActiveRecord::Migration[7.0]
  def change
    create_table :out_patients, id: false do |t|
      t.string :prefix, limit: 3
      t.string :novem_digit, limit: 9
      t.string :first_name
      t.string :last_name
      t.string :gender, limit: 1
      t.date :dob
      t.string :phone_number
      t.string :address, limit: 100
      t.timestamps
    end
    execute "alter table out_patients add primary key (prefix, novem_digit);"
  end
end
