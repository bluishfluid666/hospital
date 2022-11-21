class ModNullPatients < ActiveRecord::Migration[7.0]
  def change
    execute "alter table out_patients alter column prefix set not null"
    execute "alter table out_patients alter column novem_digit set not null"
    execute "alter table out_patients alter column first_name set not null"
    execute "alter table out_patients alter column last_name set not null"
    execute "alter table out_patients alter column dob set not null"
    execute "alter table out_patients alter column gender set not null"
    execute "alter table out_patients alter column phone_number set not null"
    execute "alter table out_patients alter column address set not null"
    
    execute "alter table in_patients alter column prefix set not null"
    execute "alter table in_patients alter column novem_digit set not null"
    execute "alter table in_patients alter column first_name set not null"
    execute "alter table in_patients alter column last_name set not null"
    execute "alter table in_patients alter column dob set not null"
    execute "alter table in_patients alter column gender set not null"
    execute "alter table in_patients alter column phone_number set not null"
    execute "alter table in_patients alter column address set not null"
  end
end
