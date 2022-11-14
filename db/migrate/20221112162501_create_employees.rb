class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, :id => false, primary_key: :unique_code do |t|
      t.string :unique_code, null:false, limit: 20
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender, limit: 1
      t.string :address, limit: 100
      t.date :start_date
      t.string :specialty_name, limit: 50
      t.integer :degree_year
      t.string :job_type, limit: 15
      t.timestamps
    end
    execute "alter table employees add primary key (unique_code);"
  end
end
