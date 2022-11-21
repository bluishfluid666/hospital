class AmendNullabilityEmployees < ActiveRecord::Migration[7.0]
  def change
    execute "alter table employees alter column first_name set not null;"
    execute "alter table employees alter column last_name set not null;"
    execute "alter table employees alter column dob set not null;"
    execute "alter table employees alter column start_date set not null;"
    execute "alter table employees alter column job_type set not null;"
  end
end
