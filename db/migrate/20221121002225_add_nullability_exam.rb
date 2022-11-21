class AddNullabilityExam < ActiveRecord::Migration[7.0]
  def change
    execute "alter table examinations alter column date_n_time set not null;"
    execute "alter table examinations alter column doctor_code set not null;"
    execute "alter table examinations alter column fee set not null;"
    execute "alter table examinations alter column out_patient_prefix set not null;"
    execute "alter table examinations alter column out_patient_novem_digit set not null;"
  end
end
